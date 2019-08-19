<template>
  <b-container class="p-0" fluid>
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

.logo {
  font-size: 5em;
}

@media (max-width: 720px) {
  .logo {
    font-size: 4em;
  }
}

</style>
