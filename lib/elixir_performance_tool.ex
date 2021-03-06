defmodule ElixirPerformanceTool do
  @moduledoc """
  Performance test tool
  Provides a function `run/2` for doing Performance test.
  """
  @url "https://ebook-homebrew.herokuapp.com/"
  @doc """
  Run performance test

  ## Params

    - process_num: parallel task number
    - max_count: repeating times

  ## Examples

      iex> ElixirPerformanceTool.run(10,10)
      "0, average_time: 1422.0 ms, time_total: 1422.0 ms"
      "2, average_time: 843.0 ms, time_total: 843.0 ms"
      "1, average_time: 1969.0 ms, time_total: 1969.0 ms"
      "3, average_time: 844.0 ms, time_total: 844.0 ms"
      "4, average_time: 844.0 ms, time_total: 844.0 ms"
  """
  def run(process_num,max_count) do
    write_csv_header()
    warmup_request(@url)
    run(process_num,max_count,0)
  end

  def run(process_num,max_count,count) when max_count !== count do
    Task.async(fn -> send_requests_parallel(process_num,count) end)
    :timer.sleep(1000)
    run(process_num,max_count,count+1)
  end

  def run(_,max_count,count) when max_count === count do
    IO.puts("process end. count:#{count}")
  end

  def send_requests_parallel(process_num,count) do
    time_total = Enum.map(1..process_num, &Task.async(fn ->
      &1
      send_requests(@url)
    end))
                 |> Enum.map(fn(task) -> Task.await(task,1000_000) end)
                 |> Enum.reduce(0, fn x,total -> total + x end)
    IO.inspect "#{count}, average_time: #{time_total / process_num / 1000} ms, time_total: #{time_total / 1000} ms"
    _ = create_table_data(count, "#{time_total / process_num / 1000}", "#{time_total / 1000}") |> write_csv
  end

  def send_requests(url) do
    try do
      time_1 = send_status(url)
      {time_2, upload_id} = send_fileupload(url)
      time_3 = send_convert_pdf(url, upload_id)
      time_4 = send_download(url, upload_id)
      time_1 + time_2 + time_3 + time_4
    rescue
      e -> IO.puts("Error: #{inspect e}")
      99999999
    end
  end

  def send_status(url) do
    status_url = url <> "status"
    {time, _} = :timer.tc(fn -> HTTPoison.get!(status_url,[],[{:timeout, :infinity}, {:recv_timeout, :infinity}]) end)
    time
  end

  def warmup_request(url) do
    status_url = url <> "status"
    _ = :timer.tc(fn -> HTTPoison.get!(status_url,[],[{:timeout, :infinity}, {:recv_timeout, :infinity}]) end)
    true
  end

  def send_fileupload(url) do
    upload_url = url <> "data/upload"
    encoded_png = create_base64png("./test.png")
    payload = Poison.encode!(%{"contentType" => "image/png", "images" => [encoded_png]})
    {time, ret} = :timer.tc(fn -> HTTPoison.post!(upload_url, payload, [],[{:timeout, :infinity}, {:recv_timeout, :infinity}]) end)
    upload_id = Poison.decode!(ret.body)["upload_id"]
    {time, upload_id}
  end

  def send_convert_pdf(url, upload_id) do
    convert_url = url <> "convert/pdf"
    payload = Poison.encode!(%{"contentType" => "image/png", "uploadId" => upload_id})
    {time, _} = :timer.tc(fn -> HTTPoison.post!(convert_url, payload, [],[{:timeout, :infinity}, {:recv_timeout, :infinity}]) end)
    time
  end

  def send_download(url, upload_id) do
    download_url = url <> "convert/pdf/download"
    payload = Poison.encode!(%{"uploadId" => upload_id})
    {time, ret} = :timer.tc(fn -> HTTPoison.post!(download_url, payload, [],[{:timeout, :infinity}, {:recv_timeout, :infinity}]) end)
    status_code = ret.status_code
    send_download(url, upload_id, time, status_code)
  end

  def send_download(url, upload_id, time, status_code) when status_code !== 200 do
    download_url = url <> "convert/pdf/download"
    payload = Poison.encode!(%{"uploadId" => upload_id})
    {time_tmp, ret} = :timer.tc(fn -> HTTPoison.post!(download_url, payload, [],[{:timeout, :infinity}, {:recv_timeout, :infinity}]) end)
    status_code = ret.status_code
    send_download(url, upload_id, time + time_tmp, status_code)
  end

  def send_download(_, _, time, status_code) when status_code === 200 do
    time
  end

  def write_csv_header() do
    file = File.open!("response.csv", [:write, :utf8])
    [["date(UTC)", "count", "average_time(ms)", "total_time(ms)"]] |> CSV.encode(headers: false) |> Enum.each(&IO.write(file, &1))
  end

  def write_csv(table_data) do
    file = File.open!("response.csv", [:append, :utf8])
    table_data |> CSV.encode(headers: false) |> Enum.each(&IO.write(file, &1))
  end

  def create_table_data(count, average_time, total_time) do
    now = NaiveDateTime.utc_now()
    {mills, _} = now.microsecond
    date = "#{now.year}-#{now.month}-#{now.day} #{now.hour}:#{now.minute}:#{now.second}.#{mills}"
    [["#{date}","#{count}", "#{average_time}", "#{total_time}"]]
  end

  def create_base64png(png_path) do
    image = File.read!(png_path)
    :base64.encode(image)
  end
end
