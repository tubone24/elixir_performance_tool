defmodule ElixirPerformanceTool do
  def run(process_num,max_count) do
    run(process_num,max_count,0)
  end

  def run(process_num,max_count,count) do
    Task.async(fn -> send_requests_parallel(process_num,count) end)
    :timer.sleep(1000)
    run(process_num,max_count,count+1)
  end

  def run(process_num,max_count,count) when max_count == count do
    IO.puts("process end. count:#{count}") # 判定すり抜け
  end

  def send_requests_parallel(process_num,count) do
    time_total = Enum.map(1..process_num, &Task.async(fn ->
      &1
      send_request("https://blog.tubone-project24.xyz")
    end))
                 |> Enum.map(fn(task) -> Task.await(task,1000_000) end)
                 |> Enum.reduce(0, fn x,total -> total + x end)

    IO.inspect "#{count}, average_time: #{time_total / process_num / 1000} ms, time_total: #{time_total / 1000} ms"
  end

  def send_request(url) do
    {time, _} = :timer.tc(fn -> HTTPoison.get!(url,[],[{:timeout, 10000000}]) end)
    time
  end

end
