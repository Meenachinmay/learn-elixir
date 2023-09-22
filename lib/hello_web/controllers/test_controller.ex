defmodule HelloWeb.TestController do
  use HelloWeb, :controller
  alias Hello.UserEmail
  alias Hello.Mailer

  def home(conn, _params) do
    render(conn, :test, layout: false)
  end

  def create(conn, %{"name" => name, "email" => email}) do
    case UserEmail.welcome(%{"name" => name, "email" => email}) |> Mailer.deliver() do
      {:ok, _} ->
        send_resp(conn, 200, "Email sent successfully")
      {:error, reason} ->
        send_resp(conn, 500, "Failed to send email: #{reason}")
    end
  end

  def getData(conn, payload) do
    IO.inspect(payload, label: "payload from client")
    name = Map.get(payload, "name")
    Phoenix.Controller.json(conn, %{"username" => name})
  end
end
