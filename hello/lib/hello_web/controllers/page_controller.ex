defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:message, "Welcome Back!")
    |> render("index.html")
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
end
