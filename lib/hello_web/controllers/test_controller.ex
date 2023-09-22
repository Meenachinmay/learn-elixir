defmodule HelloWeb.TestController do
  use HelloWeb, :controller
  alias Hello.UserEmail
  alias Hello.Mailer

  def home(conn, _params) do
    render(conn, :test, layout: false)
  end

  def create(conn, _params) do
    case UserEmail.welcome(%{"name" => "chinmay", "email" => "chinmay@gmail.com"}) |> Mailer.deliver() do
      {:ok, _} ->
        send_resp(conn, 200, "Email sent successfully")
      {:error, reason} ->
        send_resp(conn, 500, "Failed to send email: #{reason}")
    end
  end
end
