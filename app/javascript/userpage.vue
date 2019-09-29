<template>
  <b-container>
    <div id="todays_declaration" class="text-center mt-3">
      <!-- 今日やること -->
      <div
        v-model="exist_flg"
        v-if="exist_flg"
        class="text-center"
      >
        <b-jumbotron
          v-bind:header="declaration"
          bg-variant="light"
          text-variant="dark"
        >
          <b-button
            v-model="done_flg"
            v-if="!done_flg"
            v-b-tooltip.hover
            v-on:click="notifyDone"
            variant="success"
            title="有言実行できたらクリック！"
          >
            実行完了！
          </b-button>
          <b-button
            v-else
            variant="primary"
            :href="'https://twitter.com/intent/tweet?url=https%3A%2F%2Fsumi-test.herokuapp.com%2F&hashtags=%E6%9C%89%E8%A8%80%E5%AE%9FGO&text=' + declaration"
            target="_blank"
          >
            twitterで報告しよう！
          </b-button>
        </b-jumbotron>
      </div>

      <!-- 未宣言なら宣言するボタン -->
      <div
        v-else
      >
        <b-jumbotron header="予定は未定">
          <b-button
            v-b-modal.start_declare
            variant="info"
          >
            宣言しよう！
          </b-button>
        </b-jumbotron>

        <b-modal
          id="start_declare"
          v-on:ok="createTodaysDeclaration"
          title="有言実GO"
        >
          <b-form>
            <b-form-textarea
              v-model="input_declare"
              placeholder="今日は何する？"
              rows="1"
            >
            </b-form-textarea>
          </b-form>
        </b-modal>
      </div>
      <!-- 有言実行率 -->
    </div>
  </b-container>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Userpage',
  props: ['auth_token'],
  data: function() {
    return {
      exist_flg: false,   // if today's declaration exists
      done_flg: false,    // already done or not
      declaration: "",    // today's declaration
      declaration_id: "", // declaration's ID
      input_declare: "",  // text what user will declare
      auth_token_for_request: this.auth_token,   // authenticity token from parent
    }
  },
  methods: {
    // get today's declaration
    getTodaysDeclaration: function() {
      const self = this
      axios.get('/declares')
        .then(function(res) {
          if(self.exist_flg = res.data.exist) {
            self.declaration_id = res.data.declaration_id
            self.done_flg    = res.data.done
            self.declaration = res.data.todays_declare
          }
        })
    },
    // register declaration
    createTodaysDeclaration: function() {
      const self = this

      // resiter new declaration
      axios.post('/declares',{
        authenticity_token: self.auth_token_for_request,
        content: self.input_declare
      })
        .then(function(res) {
          if(res.data.registered) {
            window.alert("宣言しました！")
            setTimeout(self.getTodaysDeclaration, 100)
          }else{
            window.alert("登録に失敗しました・・・")
          }
        })
    },
    // make declaration status dane
    notifyDone: function() {
      const self = this

      // update declaration status
      axios.patch('/declares/' + self.declaration_id, {
        authenticity_token: self.auth_token_for_request,
        declaration_id: self.declaration_id
      })
        .then(function(res) {
          if(self.done_flg = res.data.updated) {
            window.alert("有言実GO！その調子！")
          }else{
            window.alert("更新に失敗しました・・・")
          }
        })
    }
  },
  created:
    function() {
      setTimeout(this.getTodaysDeclaration, 100)
    }
}
</script>

<style lang="scss">
</style>
