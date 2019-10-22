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
          <p
            v-model="done_flg"
            v-if="!done_flg"
          >
            <b-button
              v-b-tooltip.hover
              :href="text_for_share"
              target="_blank"
              variant="primary"
              title="みんなに知らせよう！"
            >
              <ion-icon class="icon_on_button" name="logo-twitter"></ion-icon>でShare
            </b-button>
            <b-button
              v-b-tooltip.hover
              v-on:click="notifyDone"
              variant="success"
              title="有言実行できたらクリック！"
            >
              実行完了！
            </b-button>
          </p>

          <b-button
            v-else
            variant="primary"
            :href="text_for_share"
            target="_blank"
          >
            <ion-icon class="icon_on_button" name="logo-twitter"></ion-icon>でも報告する
          </b-button>

          <!-- 他ユーザーのリアクション -->
          <reactions v-bind:declaration_id='declaration_id'></reactions>
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
            今日は何する？
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
              placeholder="例）部屋とお風呂とトイレを綺麗にする"
              rows="1"
            >
            </b-form-textarea>
          </b-form>
        </b-modal>
      </div>
    </div>
  </b-container>
</template>

<script>
import Reactions from './reactions.vue'

const axios = require('axios')
const service_url = location.origin
const url_for_share = 'https://twitter.com/intent/tweet?hashtags=有言実GO?url=' + service_url + '/refer/'

export default {
  name: 'Userpage',
  props: ['auth_token'],
  components: { Reactions },
  data: function() {
    return {
      exist_flg: false,   // if today's declaration exists
      done_flg: false,    // already done or not
      declaration: "",    // today's declaration
      declaration_id: "", // declaration's ID
      whose_declaration: "",  // user id who is declared
      input_declare: "",  // text what user will declare
      text_for_share: "", // text for twitter sharing
    }
  },
  created:
    function() {
      setTimeout(this.getTodaysDeclaration, 100)
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
            self.text_for_share = encodeURI(url_for_share + self.declaration_id + "&text=【今日やること】" + self.declaration)
          }
        })
    },
    // register declaration
    createTodaysDeclaration: function() {
      const self = this

      // resiter new declaration
      axios.post('/declares',{
        authenticity_token: self.auth_token,
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
    // make declaration status done
    notifyDone: function() {
      const self = this

      // update declaration status
      axios.patch('/declares/' + self.declaration_id, {
        authenticity_token: self.auth_token,
        declaration_id: self.declaration_id
      })
        .then(function(res) {
          if(self.done_flg = res.data.updated) {
            window.alert("有言実GO！その調子！")
            self.text_for_share = encodeURI(url_for_share + self.declaration_id + "&text=【完了！】" + self.declaration)
          }else{
            window.alert("更新に失敗しました・・・")
          }
        })
    }
  }
}
</script>
