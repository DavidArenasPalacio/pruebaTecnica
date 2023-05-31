import './assets/main.css'
// Import Bootstrap and BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.min.js'
import 'vue-select/dist/vue-select.css';

import { createApp } from 'vue'

import App from './App.vue'
import vSelect from 'vue-select'

import router from './router'

const app = createApp(App)

app.use(router)
app.component('v-select', vSelect)
app.mount('#app')