<template>
  <div class="text-center" style="font-size: 1.5em; user-select:none;">
    <ion-icon
      v-if="!clickable && click_counts_of_cheer < 10"
      v-on:click="click_counts_of_cheer += 1"
      name="thumbs-up"
      class="icon_on_button"
      style="cursor: pointer;"
    ></ion-icon>
    <ion-icon v-else name="thumbs-up" class="icon_on_button"></ion-icon>
    &nbsp&nbsp
    <span
      style="font-weight: bold;"
    >
      {{ cheered_counts + click_counts_of_cheer }}
    </span>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Reactions',
  props: ['declaration_id', 'auth_token_for_request'],
  data: function() {
    return {
      clickable: false,  // cheer button clickable or not
      cheered_counts: 0,          // counter for cheered numbers by other users
      click_counts_of_cheer: 0,   // counter for click numbers
    }
  },
  mounted: function() {
    this.setButtonStatus()
    this.debounceUpdateCounter = _.debounce(this.update_counter_of_db,500)
  },
  watch: {
    click_counts_of_cheer: function() {
      this.debounceUpdateCounter()
    }
  },
  methods: {
    setButtonStatus: function() {
      let self = this

      // check whose declaration
      axios.get('/reactions/' + self.declaration_id)
        .then(function(res) {
          self.cheered_counts = res.data.cheered
          if(res.data.your_declaration) {
            self.clickable = true
          }
        })
    },
    update_counter_of_db: function() {
      let self = this

      let tmp_count = this.click_counts_of_cheer
      if(tmp_count == 10) {
        this.clickable = false
      }

      axios.patch('/reactions', {
        authenticity_token: self.auth_token_for_request,
        declaration_id: self.declaration_id,
        count: self.click_counts_of_cheer
      })
        .then(function(res){
          if(res.data.updated){
            self.cheered_counts = res.data.calculated
          }
          self.click_counts_of_cheer = 0
        })
    }
  }
}
</script>
