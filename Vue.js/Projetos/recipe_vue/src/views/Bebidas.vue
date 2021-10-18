<template>
  <main class="mb-14 flex flex-col">
    <h1 class="text-red-500 text-5xl text-center">Bebidas</h1>
    <font-awesome-icon
      icon="sync-alt"
      class="text-red-500 text-9xl self-center my-24 animate-spin"
      v-if="isLoding"
    />
    <MainList :ArrayForMap="drinks" />
  </main>
</template>

<script>
import { fetchDrinksItens } from "../services/fetchItens";
import MainList from "../components/MainList";

export default {
  name: "Bebidas",
  data() {
    return {
      drinks: [],
      isLoding: true,
    };
  },
  async mounted() {
    const { drinks } = await fetchDrinksItens();
    this.drinks = drinks;
    this.isLoding = false;
  },
  components: {
    MainList,
  },
};
</script>