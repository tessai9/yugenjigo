<template>
  <div class="text-center" style="font-size: 1.5em;">
    <ion-icon
      v-model="yours"
      v-if="!yours"
      v-on:click="addCounter"
      name="thumbs-up"
      class="icon_on_button"
      style="cursor: pointer;"
    ></ion-icon>
    <ion-icon v-else name="thumbs-up" class="icon_on_button"></ion-icon>
    &nbsp&nbsp
    <span
      v-model="cheered_counts"
      style="font-weight: bold;"
    >
      {{ cheered_counts }}
    </span>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Reactions',
  props: ['declaration_id'],
  data: function() {
    return {
      yours: false,  // cheer button clickable or not
      cheered_counts: 0,          // counter for cheered numbers by other users
      click_counts_of_cheer: 0,   // counter for click numbers
      tmp_counter: 0              // temporary counter
    }
  },
  mounted: function() {
    this.setButtonStatus()
    setInterval(this.check_for_counter, 10)
  },
  methods: {
    setButtonStatus: function() {
      let self = this

      // check whose declaration
      axios.get('/reactions/' + self.declaration_id)
        .then(function(res) {
          self.yours = res.data.your_declaration
          self.cheered_counts = res.data.cheered
        })
    },
    addCounter: function() {
      // count up to 10 at one time
      if (this.click_counts_of_cheer < 11) {
        this.click_counts_of_cheer++
      }else{
        this.yours = false
      }
    },
    check_for_counter: function() {
      if (this.click_counts_of_cheer != this.tmp_counter) {
        this.update_counter_of_db
        this.tmp_counter = this.click_counts_of_cheer
      }
    },
    update_counter_of_db: async function() {
      let self = this

      await axios.patch('/reaction/' + self.click_counts_of_cheer, {
        authenticity_token: self.auth_token_for_request,
        declaration_id: self.declaration_id,
        count: self.click_counts_of_cheer
      })
    }
  }
}
</script>
