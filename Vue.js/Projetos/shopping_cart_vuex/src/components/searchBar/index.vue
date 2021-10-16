<template>
  <form @submit.prevent.stop="handleSubmitForm()">
    <input type="text" v-model="mySearch">
    <button type="submit">Procurar</button>
  </form>
</template>
<script>
export default {
  name: 'SearchBar',
  data() {
    return {
      mySearch: ''
    }
  },
  methods: {
    handleSubmitForm() {
      this.$store.commit('isLoding', true)
      this.$store.dispatch('fetchItens', this.mySearch)
    }
  }
}
</script>