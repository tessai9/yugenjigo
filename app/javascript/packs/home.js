// Vue modules
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import Axios from 'axios'
import Lodash from 'lodash'

// common modules
import App from '../app.vue'
import Navbar from '../navbar.vue'
import Userpage from '../userpage.vue'
import Tweets from '../tweets.vue'

// bootstrap css files
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

// import csrf token
import csrf_auth_token from './csrf_token'

export default new Vue({
  el: '#app',
  data: function() {
    return {
      auth_token: csrf_auth_token.csrf_auth_token
    }
  },
  components: { App, Navbar, Userpage, Tweets }
})
