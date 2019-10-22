// Vue modules
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import Axios from 'axios'
import Lodash from 'lodash'
// bootstrap css files
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// common modules
import Refer from '../refer.vue'
import Navbar from '../navbar.vue'
import Login from '../login.vue'

// import csrf token
import csrf_auth_token from './csrf_token'

Vue.use(BootstrapVue)

export default new Vue({
  el: '#referer',
  data: function() {
    return {
      auth_token: csrf_auth_token.csrf_auth_token
    }
  },
  components: { Refer, Navbar, Login }
})
