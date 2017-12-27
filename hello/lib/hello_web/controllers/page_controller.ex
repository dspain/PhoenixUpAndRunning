defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
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
