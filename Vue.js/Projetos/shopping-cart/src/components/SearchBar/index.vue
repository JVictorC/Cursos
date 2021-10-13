<template>
  <form>
    <input type="text" v-model="itemSearch" placeholder="Digite o item de Procura">
    <input type="submit" value="Procurar" @click="handleClickSearch">
  </form>
</template>
<script>
export default {
  name: 'SearchBar',
  data() {
    return {
      itemSearch: ''
    }
  },
  props: {
    getItemBySearch: Function
  },
  methods: {
    handleClickSearch(e) {
      e.preventDefault()
      this.getItemBySearch(this.itemSearch)
      this.itemSearch = ''
    }
  }
}
</script>