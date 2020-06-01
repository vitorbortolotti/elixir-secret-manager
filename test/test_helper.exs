ExUnit.start()
Faker.start()

{:ok, _} = Application.ensure_all_started(:ex_machina)

defmodule TestHelper do
  def get_json(filename) do
    file = Path.expand(filename)
    {:ok, json} = File.read(file)
    Poison.decode(json)
  end
end
