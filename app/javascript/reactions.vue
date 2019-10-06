<template>
  <div class="text-center" style="font-size: 1.5em;">
    <ion-icon name="thumbs-up" class="icon_on_button"></ion-icon>&nbsp&nbsp<span style="font-weight: bold;">{{ cheered_counts }}</span>
  </div>
</template>

<script>
const axios = require('axios')

export default {
  name: 'Reactions',
  props: ['declaration_id'],
  data: function() {
    return {
      cheer_button_clickable: false,  // cheer button clickable or not
      cheered_counts: 0,        // counter for cheered numbers by other users
      click_counts_of_cheer: 0  // counter for click numbers
    }
  },
  mounted: function() {
    this.setButtonStatus()
  },
  methods: {
    setButtonStatus: function() {
      let self = this

      // check whose declaration
      axios.get('/reactions/' + self.declaration_id)
        .then(function(res) {
          self.cheer_button_clickable = res.data.your_declaration
          self.cheered_counts = res.data.cheered
        })
    },
  }
}
</script>
