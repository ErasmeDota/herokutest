<template>
<v-app>
    <v-navigation-drawer app clippe id="dashboard-sidebar" v-bind:class="{active: isMenuActive}">
      <v-list>
        <v-list-item v-for="route in $router.options.routes" :key="route.path" :to="route.path">
          <v-list-item-action v-if="!route.path==='/login'">
            <v-icon>mdi-{{route.icon}}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>{{ route.name }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    
    <v-app-bar app clipped-left>
        <div class="hamburger" @click="toggleMenu()">
            <v-icon >mdi-menu</v-icon>
        </div>
      <v-toolbar-title>Time Manager</v-toolbar-title>
    </v-app-bar>
    <v-main>
      <v-container fluid>
        <v-fade-transition mode="out-in">
          <router-view></router-view>
        </v-fade-transition>
      </v-container>
    </v-main>      
</v-app>
</template>
<script>

export default{
    name: "navigation",

    data(){
        return {
            isLogin: false,
            isMenuActive: false
        }
    },

    methods: {
        toggleMenu(){
        this.isMenuActive = !this.isMenuActive;
        }
    }
}
</script>

<style>
    #dashboard-sidebar{
        top: 65px !important;
    }
    .v-list-item__title{
        text-align: left;
    }

    .hamburger {
        font-weight: bolder;
        padding: 20px;

    }

    .hamburger:hover {
        cursor: pointer;
        color: black;
    }

</style>
