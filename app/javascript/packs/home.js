import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import Axios from 'axios'
import App from '../app.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

export default new Vue({
  el: '#app',
  components: { App }
})
