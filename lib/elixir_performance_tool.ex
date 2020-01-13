defmodule ElixirPerformanceTool do
  def run(process_num,max_count) do
    run(process_num,max_count,0)
  end

  def run(process_num,max_count,count) do
    if max_count === count do
      IO.puts("process end. count:#{count}") # Fixme; Bad code, use recursive.
    else
      Task.async(fn -> send_requests_parallel(process_num,count) end)
      :timer.sleep(1000)
      run(process_num,max_count,count+1)
    end
  end

  def send_requests_parallel(process_num,count) do
    time_total = Enum.map(1..process_num, &Task.async(fn ->
      &1
      send_requests("https://ebook-homebrew.herokuapp.com/")
    end))
                 |> Enum.map(fn(task) -> Task.await(task,1000_000) end)
                 |> Enum.reduce(0, fn x,total -> total + x end)
    IO.inspect "#{count}, average_time: #{time_total / process_num / 1000} ms, time_total: #{time_total / 1000} ms"
  end

  def send_requests(url) do
    time_1 = send_status(url)
    {time_2, upload_id} = send_fileupload(url)
    time_3 = send_convert_pdf(url, upload_id)
    time = time_1 + time_2 + time_3
    time
  end

  def send_status(url) do
    status_url = url <> "status"
    {time, _} = :timer.tc(fn -> HTTPoison.get!(status_url,[],[{:timeout, 1000000000}]) end)
    time
  end

  def send_fileupload(url) do
    upload_url = url <> "data/upload"
    {_, encoded_png} = File.read("encoded_png.txt")
    payload = Poison.encode!(%{"contentType" => "image/png", "images" => [encoded_png]})
    {time, ret} = :timer.tc(fn -> HTTPoison.post!(upload_url, payload, [],[{:timeout, 1000000000}]) end)
    upload_id = Poison.decode!(ret.body)["upload_id"]
    {time, upload_id}
  end

  def send_convert_pdf(url, upload_id) do
    convert_url = url <> "convert/pdf"
    payload = Poison.encode!(%{"contentType" => "image/png", "uploadId" => upload_id})
    {time, _} = :timer.tc(fn -> HTTPoison.post!(convert_url, payload, [],[{:timeout, 1000000000}]) end)
    time
  end
end
