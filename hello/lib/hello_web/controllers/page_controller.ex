defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug(:assign_welcome_message, "Welcome Back" when action in [:index, :show])

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def redirect_test(conn, _params) do
    text(conn, "Redirect!")
  end

  def show(conn, %{"id" => id}) do
    page = %{title: "foo"}

    render(conn, "show.json", page: page)
  end

  def test(conn, _params) do
    render(conn, "test.html")
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
