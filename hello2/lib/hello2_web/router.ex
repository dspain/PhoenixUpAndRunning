defmodule Hello2Web.Router do
  use Hello2Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Hello2Web do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/users", UserController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hello2Web do
  #   pipe_through :api
  # end
end
