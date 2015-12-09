defmodule ScraperWoot do
  require IEx

  def start(input_file) do    
    get_str = fn(str) -> [_, x] = String.split(str, " ") ; x end

    print = fn(h) ->
      ~s(<a href="#{h[:url]}" target="blank"><img width="400" src="#{h[:image]}" title="#{h[:title]}" /></a>)
    end

    get_img = fn(url) -> 
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} = url |> HTTPoison.get
  
      IO.puts "Fetching #{url}"
      img = body |> Floki.find("#gallery .photo.fullsize-1 img") |> Floki.attribute("src") |> List.first
      title = body |> Floki.find("title") |> Floki.text |> String.replace(" - Shirt.Woot", "")
      [url: url, image: img, title: title]
    end

    {:ok, data} = File.read(input_file)

    is_blank = fn(x) -> String.length(x) == 0 end
    
    String.split(data, "\n") |> Stream.reject(is_blank) |> Stream.map(get_str) |> Stream.map(get_img) |> Stream.map(print) |>  Enum.join("\n") |> IO.puts

  end
  # ScraperWoot.start("test.txt")

end

