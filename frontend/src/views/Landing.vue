<template>
<v-app id="landing">
  <v-container fluid>
    <v-layout row wrap>
      <v-flex xs12 class="text-xs-center" mt-5>
        <h1>Welcome to Time Manager</h1>
      </v-flex>
      <v-flex xs12 sm6 offset-sm3 mt-3>
        <blockquote class="blockquote text-xs-center">
          It's a basic Single Page application <br>
          with VueJS & Elixir.Phoenix REST API
        </blockquote>
      </v-flex>
      <v-flex xs12 sm6 offset-sm3 class="text-xs-center" mt-5>
        <v-btn color="primary" to="/register">Register</v-btn>
        <v-btn to="/login">Login</v-btn>
      </v-flex>
    </v-layout>
  </v-container>
</v-app>
</template>
<script>
export default {
  //name: "Landing"
};
</script>