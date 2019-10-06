<template>
  <div class="text-center">
    <h1>{{user_name}}さんの宣言</h1>
    <b-jumbotron :header='content'>
      <p>{{cheered}}回応援されました！</p>
    </b-jumbotron>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Refer',
  props: ['user_name', 'content', 'done_flg', 'cheered'],
}
</script>
