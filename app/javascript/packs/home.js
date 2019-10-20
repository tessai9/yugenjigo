// Vue modules
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import Axios from 'axios'

// common modules
import App from '../app.vue'
import Navbar from '../navbar.vue'
import Userpage from '../userpage.vue'
import Tweets from '../tweets.vue'

// bootstrap css files
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

// find csrf token
const tags = document.getElementsByTagName("meta");
let authenticity_token = ""
for (let i = 0; i < tags.length; i++) {
  if (tags[i].name === "csrf-token") {
    authenticity_token = tags[i].content;
    break;
  }
}

export default new Vue({
  el: '#app',
  data: function() {
    return {
      auth_token: authenticity_token
    }
  },
  components: { App, Navbar, Userpage, Tweets }
})
