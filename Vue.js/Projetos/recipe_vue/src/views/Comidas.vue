<template>
  <main class="mb-14 flex flex-col">
    <h1 class="text-red-500 text-5xl text-center">Comidas</h1>
    <font-awesome-icon
      icon="sync-alt"
      class="text-red-500 text-9xl self-center my-24 animate-spin"
      v-if="isLoading"
    />
    <MainList :ArrayForMap="meals" />
  </main>
</template>
<script>
import { fetchMealsItens } from "../services/fetchItens";
import MainList from "../components/MainList";

export default {
  name: "Comidas",
  data() {
    return {
      meals: [],
      isLoading: true,
    };
  },
  async mounted() {
    const { meals } = await fetchMealsItens();
    this.meals = meals;
    this.isLoading = false;
  },
  components: {
    MainList,
  },
};
</script>