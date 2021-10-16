<template>
  <div class="flex flex-col">
    <SearchBar />
    <div class="grid grid-cols-3 mt-40">
      <CategoriesList />
      <h2 v-if="$store.state.isLoading" class="text-center m-10 text-2xl col-span-2">
        Carregando ...
      </h2>
      <MainListItens v-if="$store.state.hasSearch" />
    </div>
  </div>
</template>

<script>
import SearchBar from "./components/SearchBar";
import CategoriesList from "./components/CategoriesList";
import MainListItens from "./components/MainListItens";

export default {
  name: "App",
  components: {
    SearchBar,
    CategoriesList,
    MainListItens,
  },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
</style>
