<template>
  <div class="">
    <SearchBar />
    <CategoriesList />
    <MainListItens v-if="$store.state.hasSearch"/>
    <h2 v-if="$store.state.isLoading">Carregando ...</h2>
  </div>
</template>

<script>
import SearchBar from './components/SearchBar'
import CategoriesList from './components/CategoriesList'
import MainListItens from './components/MainListItens'

export default {
  name: 'App',
  components: {
    SearchBar,
    CategoriesList,
    MainListItens,
  }
}
</script>

<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

#app {
  font-family: Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}


</style>
