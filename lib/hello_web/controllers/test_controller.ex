defmodule HelloWeb.TestController do
  use HelloWeb, :controller

  def home(conn, _params) do
    render(conn, :test)
  end
end
