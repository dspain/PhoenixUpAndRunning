defmodule Hello2.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello2.Users.User

  schema "users" do
    field(:bio, :string)
    field(:email, :string)
    field(:name, :string)
    field(:number_of_pets, :integer)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :bio, :number_of_pets])
    |> validate_required([:name, :email, :bio])
    |> validate_length(:bio, min: 2)
  end
end
