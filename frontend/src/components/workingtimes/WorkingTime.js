import axios from "axios";

const baseUrl = 'http://localhost:4000/api';

class WorkingTime {

  createWorkingTime(userID, data)
  {
    let workingTime = {data};
    return axios.post(baseUrl+`/workingTime/${userID}`, workingTime);
  }

  updateWorkingTime(userID, id, data)
  {
    return axios.put(baseUrl + `/workingTime/${userID}/${id}`, data);
  }

  deleteWorkingTime(userID, id)
  {
    return axios.delete(baseUrl + `/users/${userID}/${id}`);
  }
}

export default new WorkingTime();