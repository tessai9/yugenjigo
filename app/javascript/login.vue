<template>
  <b-container>
    <b-button
      id="login_button"
      v-b-tooltip.hover
      href="/users/auth/twitter"
      variant="primary"
      title="口だけなんて言わせない！"
    >
      <ion-icon class="icon_on_button" name="logo-twitter"></ion-icon>ログインして宣言する
    </b-button>
    <b-button
      id="declare"
      v-b-tooltip.hover
      variant="light"
      title="お試しで！"
      href="https://twitter.com/intent/tweet?url=https%3A%2F%2Fsumi-test.herokuapp.com%2F&hashtags=%E6%9C%89%E8%A8%80%E5%AE%9FGO"
      target="_blank"
    >
      とりあえず宣言する
    </b-button>
  </b-container>
</template>

<script>
export default {
  name: 'Login'
}
</script>

<style lang="scss">
#declare {
  margin: 1em;
}

.icon_on_button {
  font-size: 1.5rem;
  vertical-align: -15%;
}
</style>
