import Vue from "vue";
import Router from "vue-router";
//import Home from "@/views/Home.vue";
import Register from "@/views/Register.vue";
import UserProfile from "@/views/UserProfile.vue";
import Landing from "@/views/Landing.vue";
import Login from "@/views/Login.vue";
import NotFound from "@/views/NotFound.vue";
import Chart from "@/views/Chart.vue";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      component: Landing,
      name: "Home",
      icon: "home"
    },
    {
      path: "/register",
      component: Register,
      name: "Registration",
      icon: "subscriptions"
    },
    {
      path: "/login",
      component: Login,
      name: "Login",
      icon: "login"
    },
    {
      path: "/profile",
      component: UserProfile,
      name: "Profile",
      icon: "account"
    },
    {
      path: "/charts",
      component: Chart,
      name: "Analytics",
      icon: "equalizer"
    },
    {
      path: "*",
      component: NotFound,
      name: "NotFound",
      icon: ""
    },

  ],
  mode: "history"
});
