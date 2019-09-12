<template>
  <b-container class="p-0 max-view-height" fluid>
    <Navbar></Navbar>
    <div class="text-center my-3">
      <h1 class="logo">
        有言実GO<ion-icon name="megaphone"></ion-icon>
      </h1>
      <p class="text-secondary">みんなに宣言したなら<b>有言実行</b>しないとね</p>
      <Login></Login>
    </div>
    <Tweets></Tweets>

    <!-- message when users login -->
    <div id="footer" class="text-center">
      Copyright 2019 Tetsunari Sumiyoshi
    </div>
  </b-container>
</template>

<script>
import Navbar from 'navbar.vue'
import Tweets from 'tweets.vue'
import Login from 'login.vue'

const axios = require('axios')

export default {
  name: 'App',
  data: function() {
    return {
      is_login: false
    }
  },
  created:
    function() {
      const self = this
      axios.get('/login_check')
        .then(res => {
          self.is_login = res.data.login_status
        })
    },
  components: { Navbar, Tweets, Login }
}
</script>

<style lang="scss" scoped>
#footer {
  bottom: 0;
  position: absolute;
  width: 100vw;
}

.logo {
  font-size: 5em;
}

.max-view-height{
  height: 100vh;
}

@media (max-width: 720px) {
  .logo {
    font-size: 4em;
  }
}

</style>
