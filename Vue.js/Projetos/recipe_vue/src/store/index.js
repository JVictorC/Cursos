import { createStore } from 'vuex'
import dataLogin from './Modules/dataLogin'

export default createStore({
  modules: {
    dataLogin,
  }
})