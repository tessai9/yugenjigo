// Vue modules
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import Axios from 'axios'
// bootstrap css files
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// common modules
import Refer from '../refer.vue'
import Navbar from '../navbar.vue'
import Login from '../login.vue'

Vue.use(BootstrapVue)

export default new Vue({
  el: '#referer',
  components: { Refer, Navbar, Login }
})
