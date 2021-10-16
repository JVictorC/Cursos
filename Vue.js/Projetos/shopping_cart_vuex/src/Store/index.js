import { createStore } from 'vuex'
import fetchItensByName from '../services/fetchMainItens'

export default createStore({
  state: {
   iten_name: '',
   itens_result: [],
   hasSearch: false,
   isLoading: false,
  },
  mutations: {
    saveNameItem(state, payload) {
      state.iten_name = payload
    },
    saveItensresults(state, payload) {
      state.itens_result = payload
    },
    isLoding(state, payload) {
      state.isLoading = payload
      state.hasSearch = !payload
    }
  },
  actions: {
    async fetchItens(context, payload) {
      const { results } = await fetchItensByName(payload)
      context.commit('saveNameItem', payload)
      context.commit('saveItensresults', results)
      context.commit('isLoding', false)
    }
  }
})