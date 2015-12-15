defmodule Seriex.Router do
  use Seriex.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Seriex do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/series", SeriesController, :index
    get "/series/:id", SeriesController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Seriex do
  #   pipe_through :api
  # end
end
