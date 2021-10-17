<template>
  <main class="mb-14">
    <h1>Comidas</h1>
    <MainList :ArrayForMap="meals" />
  </main>
</template>
<script>
import { fetchMealsItens } from "../services/fetchItens";
import MainList from '../components/MainList'

export default {
  name: "Comidas",
  data() {
    return {
      meals: [],
    };
  },
  async mounted() {
    const { meals } = await fetchMealsItens();
    this.meals = meals;
  },
  components: {
    MainList
  },
};
</script>