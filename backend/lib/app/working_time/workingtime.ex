defmodule Timemachine.WorkingTime.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :naive_datetime
    field :start, :naive_datetime

    belongs_to :user, Timemachine.Account.User

    timestamps()
  end

  @doc false
  def changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [:user_id, :start, :end])
    |> validate_required([:start, :end])
    |> foreign_key_constraint(:user_id)
  end
end
