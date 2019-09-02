<template>
  <b-container>
    <b-button
      id="login_button"
      v-b-tooltip.hover
      href="/auth/twitter"
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
      href="https://twitter.com/intent/tweet?hashtags=有言実GO"
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
