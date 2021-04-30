defmodule PhoenixapiWeb.Router do
  use PhoenixapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixapiWeb do
    pipe_through :api

    # create a get function to / endpoint
    get "/", WelcomeController, :index

    # create a new route to insert a restaurante (post)
    post "/restaurants", RestaurantsController, :create

    # when we use resources, phx will create all routers from a controller
    # to see it, use mix phx.routes
    # We can choice the methods we want using only:
    resources "/supplies", SuppliesController, only: [:create, :show]
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
      live_dashboard "/dashboard", metrics: PhoenixapiWeb.Telemetry
    end
  end

  # Router to debug Bamboo emails
  if Mix.env() == :dev do
    forward "/send_emails", Bamboo.SentEmailViewerPlug
  end
end
