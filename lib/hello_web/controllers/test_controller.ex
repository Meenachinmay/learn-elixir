defmodule HelloWeb.TestController do
  use HelloWeb, :controller

  def home(conn, _params) do
    render(conn, :test, layout: false)
  end
end
