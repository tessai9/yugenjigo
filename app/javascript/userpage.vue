<template>
  <b-container>
    <div class="text-center">
      <!-- ユーザーの今日やること -->
      <div class="text-center">
        <b-jumbotron v-if="!done_flg" header="有言実GOを完成させる">
          <b-button>できた？</b-button>
        </b-jumbotron>
        <b-jumbotron v-else header="有言実GOを完成させる">
          <b-button>twitterで自慢する</b-button>
        </b-jumbotron>
      </div>
      <!-- 未宣言なら宣言するボタン -->
      <!-- 有言実行率 -->
    </div>
  </b-container>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Userpage',
  data: function() {
    return {
      todays_task: [],
      done_flg: false,
      declaration: ""
    }
  },
  methods: {
    getTodaysDeclaration: function() {
      const self = this
      axios.get('/declares')
        .then(function(res) {
          console.log(res)
        })
    }
  },
  created:
    function() {
      setTimeout(this.getTodaysDeclaration, 1000)
    }
}
</script>

<style lang="scss">
</style>
