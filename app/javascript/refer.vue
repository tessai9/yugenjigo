<template>
  <div class="text-center">
    <h1>{{user_name}}さんの宣言</h1>
    <b-jumbotron
      :header='content'
      bg-variant="light"
      text-variant="dark"
    >
      <Reactions v-bind:declaration_id='declaration_id'></Reactions>
    </b-jumbotron>
  </div>
</template>

<script>
import Reactions from './reactions.vue'

const axios = require('axios')

export default {
  name: 'Refer',
  props: ['declaration_id', 'user_name', 'content', 'done_flg'],
  components: { Reactions }
}
</script>
