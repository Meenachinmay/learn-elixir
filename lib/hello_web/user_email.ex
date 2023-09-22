defmodule Hello.UserEmail do
  import Swoosh.Email

  def welcome(%{"name" => name, "email" => email}) do
    new()
    |> to({name, email})
    |> from({"Dr B Banner", "hulk.smash@example.com"})
    |> subject("Hello, Avengers!")
    |> html_body("<h1>Hello #{name}</h1>")
    |> text_body("Hell #{name} \n")
  end
end
