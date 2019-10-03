<template>
  <b-container class="p-0" fluid>
    <b-navbar type="dark" variant="info"　toggleable="sm">
      <b-navbar-brand id="service_title" href="/">
        GO<ion-icon name="megaphone"></ion-icon>
      </b-navbar-brand>
      <b-navbar-toggle target="header_menu"></b-navbar-toggle>

      <b-collapse id="header_menu" is-nav>
        <b-navbar-nav>
          <b-nav-item
            v-b-modal.what_yugenjigo
          >
            有言実GOとは？
          </b-nav-item>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
    <b-modal
      id="what_yugenjigo"
      title="有言実GOとは"
    >
      <p>「やらなきゃだけどめんどくさい..」となってしまうあなたに。</p>
      <p>宣言して、応援してもらって、有言実行して褒めてもらいましょう！</p>
    </b-modal>
  </b-container>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Navbar'
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Sawarabi+Mincho&display=swap');

b-container {
  padding: 0px;
}

#service_title {
  font-family: 'Sawarabi Mincho', sans-serif;
  font-size: 2em;
}

@media (max-width: 720px) {
  #service_title {
    font-size: 1.5em;
  }
}

</style>
