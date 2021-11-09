defmodule Timemachine.Clocked.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :status, :boolean, default: true
    field :time, :naive_datetime

    belongs_to :user, Timemachine.Account.User
    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:user_id, :time, :status])
    |> validate_required([:time, :status])
    |> foreign_key_constraint(:user_id)
  end
end
