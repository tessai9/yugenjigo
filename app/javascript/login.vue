<template>
  <b-container>
    <b-button
      id="login_button"
      href="/users/auth/twitter"
      variant="primary"
    >
      <ion-icon class="icon_on_button" name="logo-twitter"></ion-icon>ログインして宣言する
    </b-button>
    <b-button
      id="declare"
      variant="light"
      v-b-modal.try_service
    >
      とりあえず宣言する
    </b-button>
    <b-modal
      id="try_service"
      v-on:ok="declareForTry"
      title="有言実GO"
    >
      <b-form>
        <b-form-textarea
          v-model="input_text_for_try"
          placeholder="例）有言実GOをはじめる"
          rows="1"
        >
        </b-form-textarea>
      </b-form>
    </b-modal>
  </b-container>
</template>

<script>
export default {
  name: 'Login',
  data: function() {
    return {
      url_for_try: encodeURI('https://twitter.com/intent/tweet?hashtags=有言実GO&url=' + location.origin + "&text=【今日やること】"),
      input_text_for_try: ''
    }
  },
  methods: {
    declareForTry: function() {
      window.open(this.url_for_try + this.input_text_for_try,'_blank')
    }
  }
}
</script>

<style lang="scss">
#declare {
  margin: 1em;
}
</style>
