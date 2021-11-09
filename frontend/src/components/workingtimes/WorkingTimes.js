import axios from 'axios';

const baseUrl = "http://localhost:4000/api";

class WorkingTimes{

    getWorkingTimes(userID)
    {
        return axios.get(baseUrl + `/workingTimes/${userID}`);
    }

    getAll(userID, email, username)
    {
        return axios.get(baseUrl + `/workingtimes/${userID}/${email}/${username}`);
    }

}

export default new WorkingTimes();