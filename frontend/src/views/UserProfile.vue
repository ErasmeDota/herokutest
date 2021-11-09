 <template>
 <v-app>
    <v-card class="mx-auto" max-width="434" tile>
        <v-img height="100%" src="https://cdn.vuetifyjs.com/images/cards/server-room.jpg"></v-img>
          <v-col>
            <v-avatar size="100" style="position:absolute; top: 130px">
              <v-img src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"></v-img>
            </v-avatar>
          </v-col>
            <v-list-item color="rgba(0, 0, 0, .4)">
              <v-list-item-content>
                <v-list-item-title class="title">Username: {{ user.username }}</v-list-item-title>
                <v-list-item-subtitle>Email: {{ user.email }}</v-list-item-subtitle>
                  <v-list-item-subtitle>ID: {{ user.id }}</v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>
    </v-card>
    <Chart />
 </v-app>
</template>

<script>
import Chart from '@/views/Chart.vue';
import User from "../components/accounts/User";

export default {
  name: "user-profile",
  components: { Chart },

   data () {
      return {
        user: {
          email: null,
          username: null,
          id: null
        }
      }
  },

  methods: {
    async getUser(){
      //@TODO get current user id from session
      let id = 3;
      return User.getUser(id).then(res => {
        return res.data;
      }).catch(err => {
        console.log(err);
      });
    }
  },

  async beforeMount(){
    const userBody = await this.getUser();
    this.user = Object.assign({}, userBody.data);
  }
};
</script>