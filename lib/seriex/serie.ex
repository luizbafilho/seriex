defmodule Seriex.Serie do
  @base_url "https://www.popcorntime.ws/api/eztv"

  def fetch(id) do
    %{ body: body } = HTTPoison.get!("#{@base_url}/show/#{id}")
    Poison.Parser.parse! body
  end
end
