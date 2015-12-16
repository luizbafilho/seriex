defmodule Seriex.SeriesView do
  use Seriex.Web, :view

  def seasons(%{"_embedded" => %{"episodes" => episodes}}) do
    episodes |> Enum.chunk_by(&(&1["season"]))
  end
end
