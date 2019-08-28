<template>
  <b-container class="p-0 max-view-height" fluid>
    <Navbar></Navbar>
    <div class="text-center my-3">
      <h1 class="logo">
        有言実GO<ion-icon name="megaphone"></ion-icon>
      </h1>
      <b-container>
        <b-button
          id="declare"
          variant="primary"
          href="https://twitter.com/intent/tweet?hashtags=有言実GO"
          target="_blank"
        >
          宣言する
        </b-button>
      </b-container>
    </div>
    <Tweets></Tweets>
    <div id="footer" class="text-center">
      Copyright 2019 Tetsunari Sumiyoshi
    </div>
  </b-container>
</template>

<script>
import Navbar from 'navbar.vue'
import Tweets from 'tweets.vue'

export default {
  name: 'App',
  components: { Navbar, Tweets }
}
</script>

<style lang="scss" scoped>
#declare {
  margin: 1em;
}

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
