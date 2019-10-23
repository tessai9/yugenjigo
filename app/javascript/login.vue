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
      :href="url_for_try"
      target="_blank"
    >
      とりあえず宣言する
    </b-button>
  </b-container>
</template>

<script>
export default {
  name: 'Login',
  data: function() {
    return {
      url_for_try: encodeURI('https://twitter.com/intent/tweet?hashtags=有言実GO&url=' + location.origin)
    }
  }
}
</script>

<style lang="scss">
#declare {
  margin: 1em;
}
</style>
