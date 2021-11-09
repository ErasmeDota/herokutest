<template>
  <v-main>
    <v-container fluid="true">
    <v-content>
        <v-parallax :src="require('@/assets/bg.jpg')" height="600" alt="background">
            <v-layout column align-center justify-center>
              <h1>Welcome, Time Manager !</h1>
            </v-layout>
        </v-parallax>
    </v-content>
    </v-container>
  </v-main>
</template>

<script>
export default{
}
</script>