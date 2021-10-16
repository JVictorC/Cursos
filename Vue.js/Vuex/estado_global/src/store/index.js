import { createStore } from 'vuex'

export default createStore({
  state: {
    user: 'João',
    name: 'Victor'
  },
  mutations: {
    saveUser(state, payload) {
     state.user = payload
    }
  },
  actions: {
    saveUser(context, payload) {
      context.commit('saveUser', payload)
    },
  },
  modules: {
  }
})
