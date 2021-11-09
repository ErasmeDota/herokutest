defmodule TimemachineWeb.ClockController do
  use TimemachineWeb, :controller

  alias Timemachine.Clocked
  alias Timemachine.Clocked.Clock

  action_fallback TimemachineWeb.FallbackController

  def index(conn, params) do
    clocks = Clocked.list_clocks(params.userID)
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clocks" => clock_params, "userID" => userID}) do
    clock_params = Map.put(clock_params, "user_id", userID)
    with {:ok, %Clock{} = clock} <- Clocked.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"userID" => userID}) do
    clock = Clocked.get_clock!(userID)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Clocked.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Clocked.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Clocked.get_clock!(id)

    with {:ok, %Clock{}} <- Clocked.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
