<template>
  <v-container fluid>
    <v-layout row wrap>
      <v-flex xs12 class="text-xs-center" mt-5>
        <h1>Login</h1>
      </v-flex>
      <v-flex xs12 sm6 offset-sm3 mt-3>
        <form>
          <v-layout column>
            <v-flex>
              <v-text-field
                name="email"
                label="Email"
                id="email"
                type="email"
                v-model="user.email"
                required></v-text-field>
            </v-flex>
            <v-flex>
              <v-text-field
                name="password"
                label="Password"
                id="password"
                type="password"
                v-model="user.password"
                required></v-text-field>
            </v-flex>
            <v-flex class="text-xs-center" mt-5>
              <v-btn @click="login()" color="primary" type="submit">Login</v-btn>
              OR
              <router-link to="/register">Register</router-link>
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
  name: "user-login",

  data(){
    return {
      user: {
        email: null,
        password: null
      }
    }
  },

  methods: {
    login(){
      //@TODO implement user authentification
      User.getUser(1);
    }
  }
};
</script>
