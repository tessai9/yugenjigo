<template>
  <b-container id="other_declaration" class="p-0" fluid>
    <h4>みんなの宣言</h4>
    <b-card-group v-if="!error_flg" class="tweet_group" deck>
      <b-card
        v-for="tweet in get_data"
        v-bind:key="tweet.data"
        class="tweet my-1"
        border-variant="primary"
        :header="tweet.user.name"
        header-bg-variant="default"
        align="center"
      >
        <b-card-text>{{tweet.text}}</b-card-text>
      </b-card>
    </b-card-group>
    <p v-else>{{error_message}}</p>
    <div  v-model="load_flg" v-if="!load_flg" class="text-center">
      <b-spinner variant="success"></b-spinner>
    </div>
  </b-container>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Tweets',
  data: function() {
    return {
      error_flg: false,
      error_message: "今日はゆっくり休もうぜ（エラーが起きました）",
      load_flg: false,
      get_data: []
    }
  },
  methods:{
    getTweets: function() {
      const self = this
      axios.get('/twitter')
        .then(function(res){
          if (!res.statusText == "OK"){
            self.error_flg = true
          }
          self.get_data = res.data.statuses
          self.num_of_tweets = res.data.length
          self.load_flg = true
        })
    }
  },
  created:
    function() {
      setTimeout(this.getTweets, 500)
    }
}
</script>

<style lang="scss" scoped>
#other_declaration {
  max-width: 75%;
}

.tweet_group {
  flex-flow: row wrap;
  display: flex;
  .tweet {
    font-size: 0.7em;
    text-overflow: ellipsis;
    display: inline-block;
    min-width: 14rem;
    max-width: 14rem;
  }
}

@media (max-width: 720px) {
  .tweet_group {
    text-align: center;
    display: block;
  }
}

</style>
