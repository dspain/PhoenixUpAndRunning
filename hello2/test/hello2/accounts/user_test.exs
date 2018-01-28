defmodule Hello2.Users.UserTest do
  use Hello2.DataCase

  alias Hello2.Users.User

  @valid_attrs %{bio: "my life", email: "pat@example.com", name: "Pat Example", number_of_pets: 4}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "number_of_pets is not required" do
    changeset = User.changeset(%User{}, Map.delete(@valid_attrs, :number_of_pets))
    assert changeset.valid?
  end

  test "bio must be at least two characters long" do
    attrs = %{@valid_attrs | bio: "I"}
    changeset = User.changeset(%User{}, attrs)
    assert %{bio: ["should be at least 2 character(s)"]} = errors_on(changeset)
  end

  test "bio must be at most 140 characters long" do
    attrs = %{@valid_attrs | bio: String.duplicate("a", 141)}
    changeset = User.changeset(%User{}, attrs)
    assert %{bio: ["should be at most 140 character(s)"]} = errors_on(changeset)
  end
end
