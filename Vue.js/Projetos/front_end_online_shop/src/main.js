import { createApp } from 'vue'
import App from './App.vue'
import store from './Store'
import './assets/tailwind.css'

createApp(App).use(store).mount('#app')
