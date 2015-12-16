defmodule EZTV do
  @base_url "https://eztv.ag"

  def get_magnet(name: name, season: season, episode: episode) do
    ep = episode |> Integer.to_string |> String.rjust(2, ?0)
    s = season |> Integer.to_string |> String.rjust(2, ?0)
    path = "/search/#{name} S#{s}E#{ep} 720p"

    request(path)
  end

  def fetch(id) do
    path = "/shows/#{id}?embed=episodes"
    request(path)
  end

  defp request(path) do
    @base_url <> path
    |> URI.encode
    |> HTTPoison.get!
    |> parse_request
  end

  defp parse_request(%{status_code: 200, body: body}) do
    Floki.find(body, "a.magnet") |> Floki.attribute("href") |> List.first
  end
end
