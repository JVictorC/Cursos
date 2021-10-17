export default {
  state: {
    userEmail: 'marco'
  },
  mutations: {
    saveUser(state, payload) {
      state.userEmail = payload
    }
  }
}