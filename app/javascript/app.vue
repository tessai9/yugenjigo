<template>
  <b-container class="p-0" fluid>
    <Navbar></Navbar>
    <div class="text-center my-3">
      <h1 class="logo">有言実GO<ion-icon name="megaphone"></ion-icon></h1>
      <b-container>
        <b-form-textarea
              id="declare"
              v-model="input_message"
              placeholder="今日は何する？"
              size="sm"
        ></b-form-textarea>
        <b-button
          variant="primary"
          :href="'https://twitter.com/intent/tweet?hashtags=有言実GO&text='+input_message"
          target="_blank"
        >
          宣言する
        </b-button>
      </b-container>
    </div>
  </b-container>
</template>

<script>
import Navbar from 'navbar.vue'

const axios = require('axios')
const twitter_url = ""

export default {
  name: 'App',
  data: function() {
    return {
      error_flg: false,
      error_message: "今日はゆっくり休もうぜ（エラーが起きました）",
      input_message: "",
      test_msg: ""
    }
  },
  components: { Navbar }
}
</script>

<style scoped>
/*
#twitter {
  font-size: 1.3em;
  color: #fff;
  line-height: .75em;
  vertical-align: -20%;
}
*/
#declare {
  margin: 1em;
}
.logo {
  font-size: 5em;
}
</style>
