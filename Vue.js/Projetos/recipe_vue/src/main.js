import { library } from "@fortawesome/fontawesome-svg-core";
import { faCompass, faWineGlass, faHamburger } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

library.add(faCompass, faWineGlass, faHamburger);


import { createApp } from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import './assets/tailwind.css'


createApp(App)
  .use(router)
  .use(store)
  .component("font-awesome-icon", FontAwesomeIcon)
  .mount('#app')
