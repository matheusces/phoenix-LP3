defmodule Ex7ToDoWeb.PageController do
  use Ex7ToDoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
