defmodule TimemachineWeb.Router do
  use TimemachineWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", TimemachineWeb do
    pipe_through :api
    get "/users/:email/:username", UserController, :index
    get "/users/:userID", UserController, :show
    post "/users", UserController, :create
    put "/users/:userID", UserController, :update
    delete "/users/:userID", UserController, :delete
    get "/workingtimes/:userID/:email/:username", WorkingtimeController, :index
    get "/workingtimes/:id", WorkingtimeController, :show
    post "/workingtimes/:userID", WorkingtimeController, :create
    put "/workingtimes/:id", WorkingtimeController, :update
    delete "/workingtimes/:id", WorkingtimeController, :delete
    get "/clocks/:userID", ClockController, :show
    post "/clocks/:userID", ClockController, :create
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: TimemachineWeb.Telemetry
    end
  end
end
