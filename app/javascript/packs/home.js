import Vue from 'vue/dist/vue.esm'
import BootstrapVue from 'bootstrap-vue'
import App from '../app.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

export default new Vue({
  el: '#app',
  data: {
    message: "this message is from home.js"
  },
  components: { App }
})
