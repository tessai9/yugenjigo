<template>
  <b-container class="p-0 max-view-height" fluid>
    <div class="text-center my-3">
      <h1 class="logo">
        有言実GO<ion-icon name="megaphone"></ion-icon>
      </h1>
      <p class="text-secondary">みんなに宣言したなら<b>有言実行</b>しないとね</p>
      <Login></Login>
    </div>
  </b-container>
</template>

<script>
import Login from 'login.vue'

const axios = require('axios')

export default {
  name: 'App',
  components: { Login }
}
</script>

<style lang="scss">
.logo {
  font-size: 5em;
}

@media (max-width: 720px) {
  .logo {
    font-size: 4em;
  }
}

@media (max-width: 400px) {
  .logo {
    font-size: 3em;
  }
}

</style>
