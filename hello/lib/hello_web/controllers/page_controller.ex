defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug :assign_welcome_message, "Welcome Back" when action in [:index, :show]

  def index(conn, _params) do
    conn
    # |> assign(:message, "Welcome Forward")
    # |> render("index.html")
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
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
