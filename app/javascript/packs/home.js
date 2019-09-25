// Vue modules
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import Axios from 'axios'

// common modules
import App from '../app.vue'
import Navbar from '../navbar.vue'
import Userpage from '../userpage.vue'

// bootstrap css files
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

export default new Vue({
  el: '#app',
  components: { App, Navbar, Userpage }
})
