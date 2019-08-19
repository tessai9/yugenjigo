<template>
  <div class="text-center">
    <ul v-for:>
    </ul>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Tweets',
  data: function() {
    return {
      error_flg: false,
      error_message: "今日はゆっくり休もうぜ（エラーが起きました）",
      get_data: []
    }
  },
  created:
    async function() {
      await axios
        .get('/twitter')
        .then(res => function() {
          console.log(res)
        })
    }
}
</script>

<style lang="scss" scoped>
</style>
