defmodule Seriex.SeriesController do
  use Seriex.Web, :controller

  def index(conn, %{"q" => query}) do
    shows = TVMaze.search(query)
    render conn, "index.html", shows: shows
  end

  def index(conn, _params) do
    render conn, "index.html", shows: []
  end

  def show(conn, %{"id" => id}) do
    serie = TVMaze.fetch(id)

    render conn, "show.html", serie: serie
  end
end
