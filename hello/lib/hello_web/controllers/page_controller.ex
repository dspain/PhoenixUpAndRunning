defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug :assign_welcome_message, "Welcome Back" when action in [:index, :show]

  def index(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]

    render conn, "index.json", pages: pages
  end

  def redirect_test(conn, _params) do
    text conn, "Redirect!"
  end

  def show(conn, %{"id" => id}) do
    page = %{title: "foo"}

    render conn, "show.json", page: page
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
