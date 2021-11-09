<template>
  <v-container fluid>
    <v-layout row wrap>
      <v-flex xs12 class="text-xs-center" mt-5>
        <h1>Registration</h1>
      </v-flex>
      <v-flex xs12 sm6 offset-sm3 mt-3>
        <form @submit.prevent="saveUser()">
          <v-layout column>
            <v-flex>
              <v-text-field
                name="email"
                label="Email"
                id="email"
                type="email"
                v-model="users.email"
                required></v-text-field>
            </v-flex>
            <v-flex>
              <v-text-field
                name="username"
                label="Username"
                id="username"
                type="text"
                v-model="users.username"
                required></v-text-field>
            </v-flex>
            <v-flex>
              <v-text-field
                name="password"
                label="Password"
                id="password"
                type="password"
                required
                v-model="users.password"
                ></v-text-field>
            </v-flex>
            <v-flex>
              <v-text-field
                name="password_confirmation"
                label="Confirm Password"
                id="password_confirmation"
                type="password"
                required
                v-model="users.password_confirmation"
                ></v-text-field>
            </v-flex>
            <v-flex class="text-xs-center" mt-5>
              <v-btn color="primary" type="submit">Register</v-btn>
                OR
              <router-link to="/login">Login</router-link>
            </v-flex>
          </v-layout>
        </form>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import User from "../components/accounts/User";

export default {
  name: "create-user",
  data() {
    return {
      users: {
        email: null,
        username: null,
        password: null,
        password_confirmation: null
      },
      submitted: false
    };
  },
  methods: {
    saveUser() {
      var data = {
        email: this.users.email,
        username: this.users.username,
        password: this.users.password,
        password_confirmation: this.users.password_confirmation
      };

      console.table(data);

      User.createUser(data)
        .then(response => {
          console.log(response.data);
          this.submitted = true;
        })
        .catch(e => {
          console.error("error", e);
        });
    },
    
    newUser() {
      this.submitted = false;
      this.users = {};
    },

    getUser(){
      User.getUser(1)
    }
  }
};
</script>
