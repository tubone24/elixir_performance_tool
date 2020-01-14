searchNodes=[{"ref":"ElixirPerformanceTool.html","title":"ElixirPerformanceTool","type":"module","doc":"Performance test tool Provides a function run/2 for doing Performance test."},{"ref":"ElixirPerformanceTool.html#create_table_data/3","title":"ElixirPerformanceTool.create_table_data/3","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#run/2","title":"ElixirPerformanceTool.run/2","type":"function","doc":"Run performance test Params process_num: parallel task number max_count: repeating times Examples iex&gt; ElixirPerformanceTool.run(10,10) &quot;0, average_time: 1422.0 ms, time_total: 1422.0 ms&quot; &quot;2, average_time: 843.0 ms, time_total: 843.0 ms&quot; &quot;1, average_time: 1969.0 ms, time_total: 1969.0 ms&quot; &quot;3, average_time: 844.0 ms, time_total: 844.0 ms&quot; &quot;4, average_time: 844.0 ms, time_total: 844.0 ms&quot;"},{"ref":"ElixirPerformanceTool.html#run/3","title":"ElixirPerformanceTool.run/3","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#send_convert_pdf/2","title":"ElixirPerformanceTool.send_convert_pdf/2","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#send_download/2","title":"ElixirPerformanceTool.send_download/2","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#send_download/4","title":"ElixirPerformanceTool.send_download/4","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#send_fileupload/1","title":"ElixirPerformanceTool.send_fileupload/1","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#send_requests/1","title":"ElixirPerformanceTool.send_requests/1","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#send_requests_parallel/2","title":"ElixirPerformanceTool.send_requests_parallel/2","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#send_status/1","title":"ElixirPerformanceTool.send_status/1","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#warmup_request/1","title":"ElixirPerformanceTool.warmup_request/1","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#write_csv/1","title":"ElixirPerformanceTool.write_csv/1","type":"function","doc":""},{"ref":"ElixirPerformanceTool.html#write_csv_header/0","title":"ElixirPerformanceTool.write_csv_header/0","type":"function","doc":""},{"ref":"readme.html","title":"Ebook Homebrew: ElixirPerformanceTool","type":"extras","doc":"Ebook Homebrew: ElixirPerformanceTool Checking TAT benchmark test tools for Parallel HTTP requests by Elixir."},{"ref":"readme.html#table-of-contents","title":"Ebook Homebrew: ElixirPerformanceTool - Table of Contents","type":"extras","doc":"Background Install Usage Contributing License"},{"ref":"readme.html#background","title":"Ebook Homebrew: ElixirPerformanceTool - Background","type":"extras","doc":"One day, I needed to test the performance of Ebook Homebrew, and decided to solve it by creating a load testing tool that could send a lot of requests in parallel."},{"ref":"readme.html#install","title":"Ebook Homebrew: ElixirPerformanceTool - Install","type":"extras","doc":"Preconditions Dependencies Install dependencies by Mix. mix deps.get Installation for another modules If available in Hex, the package can be installed by adding elixir_performance_tool to your list of dependencies in mix.exs: def deps do [ {:elixir_performance_tool, &quot;~&gt; 0.1.0&quot;} ] end Documentation can be generated with ExDoc and published on HexDocs. Once published, the docs can be found at https://hexdocs.pm/elixir_performance_tool."},{"ref":"readme.html#usage","title":"Ebook Homebrew: ElixirPerformanceTool - Usage","type":"extras","doc":"Run the test by IEx. Run the test by IEx. iex -S mix iex(1)&gt; ElixirPerformanceTool.run(10, 10) Function ElixirPerformanceTool.run set 2 args, first one is parallel task number, second one is repeating times."},{"ref":"readme.html#contributing","title":"Ebook Homebrew: ElixirPerformanceTool - Contributing","type":"extras","doc":"See the contributing file! PRs accepted. Small note: If editing the Readme, please conform to the standard-readme specification."},{"ref":"readme.html#license","title":"Ebook Homebrew: ElixirPerformanceTool - License","type":"extras","doc":"MIT © tubone."}]