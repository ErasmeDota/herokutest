import axios from "axios";

var baseUrl = 'http://localhost:4000/api/v1';

class User {

  getUser(id) {
    return axios.get(baseUrl+`/users/${id}`);
  }

  createUser(users) {
    let data = {users};
    return axios.post(baseUrl+"/users", data);
  }

  updateUser(id, data) {
    return axios.put(baseUrl + `/users/${id}`, data);
  }

  deleteUser(id) {
    return axios.delete(baseUrl + `/users/${id}`);
  }
}

export default new User();