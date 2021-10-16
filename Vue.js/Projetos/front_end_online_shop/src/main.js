import { createApp } from 'vue'
import App from './App.vue'
import store from './Store'
import './assets/tailwind.css'
import router from './router'

createApp(App).use(router).use(store).mount('#app')
