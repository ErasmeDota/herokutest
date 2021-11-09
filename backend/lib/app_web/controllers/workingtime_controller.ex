defmodule TimemachineWeb.WorkingtimeController do
  use TimemachineWeb, :controller

  alias Timemachine.WorkingTime
  alias Timemachine.WorkingTime.Workingtime

  action_fallback TimemachineWeb.FallbackController

  def index(conn, _params) do
    workingtimes = WorkingTime.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"workingtimes" => working_time_params, "userID" => userID}) do
    working_time_params = Map.put(working_time_params, "user_id", userID)
    with {:ok, %Workingtime{} = workingtime} <- WorkingTime.create_workingtime(working_time_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = WorkingTime.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtimes" => workingtime_params}) do
    workingtime = WorkingTime.get_workingtime!(id)
    workingtime_params = Map.put(workingtime_params, "user_id", id)
    with {:ok, %Workingtime{} = workingtime} <- WorkingTime.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = WorkingTime.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- WorkingTime.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
