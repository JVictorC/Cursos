import { createStore } from 'vuex'
import fetchItensByName from '../service/fetchItensByName'
import fetchItensByCategory from '../service/fetchItensByCategory'

export default createStore({
  state: {
    nameIten: '',
    results: [],
    hasSearch: false,
    isLoading: false,
  },
  mutations: {
    saveNameIten(state, payload) {
      state.nameIten = payload
    },
    saveItensFetch(state, payload) {
      state.results = [...payload]
    },
    chageState(state, payload) {
      state.isLoading = payload
      state.hasSearch = !payload
    }
  },
  actions: {
    async getItensByName(context, payload) {
      context.commit('chageState', true)
      const { results } = await fetchItensByName(payload)
      context.commit('saveNameIten', payload)
      context.commit('saveItensFetch', results)
      context.commit('chageState', false)
    },
    async getItensByCategory(context, payload) {
      context.commit('chageState', true)
      const { results } = await fetchItensByCategory(payload)
      context.commit('saveNameIten', payload)
      context.commit('saveItensFetch', results)
      context.commit('chageState', false)
    }
  },
})