defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug :assign_welcome_message, "Welcome Back" when action in [:index, :show]

  def index(conn, _params) do
    redirect conn, external: redirect_test_url(conn, :redirect_test)
  end

  def redirect_test(conn, _params) do
    text conn, "Redirect!"
  end

  def show(conn, %{"id" => id}) do
    html conn, """
      <html>
        <head>
          <title>Passing an Id</title>
        </head>
        <body>
          <p>You sent in id #{id}</p>
        </body>
      </html>
    """
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
