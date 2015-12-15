defmodule TVMaze do
  @base_url "http://api.tvmaze.com"

  def search(title) do
    path = "/search/shows?q=#{title}"
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
    Poison.Parser.parse! body
  end
end
