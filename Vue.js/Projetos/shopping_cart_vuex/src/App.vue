<template>
  <div>
    <SearchBar />
    <MainListItem v-if="hasSearch"/>
    <h2 v-if="isLoading">Carregando ...</h2>
  </div>
</template>

<script>
import SearchBar from "./components/searchBar";
import MainListItem from './components/mainListItens'

export default {
  name: "App",
  data() {
    return {
      hasSearch: this.$store.state.hasSearch,
      isLoading: this.$store.state.isLoading,
    }
  },
  watch: {
    '$store.state.hasSearch': function() {
      this.hasSearch = this.$store.state.hasSearch
    },
    '$store.state.isLoading': function() {
      this.isLoading = this.$store.state.isLoading
    }
  },
  components: {
    SearchBar,
    MainListItem
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
