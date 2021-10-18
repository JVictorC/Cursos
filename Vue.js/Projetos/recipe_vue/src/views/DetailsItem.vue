<template>
  <div class="flex flex-col items-center justify-center mb-20">
    <h1 class="text-7xl text-red-600 my-5">Details</h1>
    <font-awesome-icon
      icon="sync-alt"
      class="text-red-500 text-9xl self-center my-24 animate-spin"
      v-if="isLoding"
    />
    <main class="flex flex-col justify-center items-center" v-if="!isLoding">
      <p class="text-5xl text-red-600 my-5">
        {{ ObjectItem.strMeal || ObjectItem.strDrink }}
      </p>
      <img
        :src="ObjectItem.strMealThumb || ObjectItem.strDrinkThumb"
        :alt="ObjectItem.strMeal || ObjectItem.strDrink"
        class="w-4/5 h-4/5 rounded-xl"
      />
      <p class="text-5xl text-red-600 my-5">
        Area: {{ ObjectItem.strArea || ObjectItem.strGlass }}
      </p>
    </main>
  </div>
</template>
<script>
import { computed } from "@vue/reactivity";
import { useRoute, useRouter } from "vue-router";
import {
  fetchMealsItensById,
  fetchDrinksItensById,
} from "../services/fetchItensById";

export default {
  name: "DetailsItem",
  data() {
    return {
      ObjectItem: {},
      isLoding: true,
    };
  },
  setup() {
    const route = useRoute();
    const router = useRouter();
    return {
      params: computed(() => route.params.id),
      path: computed(() => route.path),
      handleWrongSearch: () => {
        router.push("/notFound");
      },
    };
  },
  async mounted() {
    if (this.path.includes("/comidas")) {
      try {
        const { meals } = await fetchMealsItensById(this.params);

        meals
          ? ((this.ObjectItem = meals[0]), (this.isLoding = false))
          : this.handleWrongSearch();
      } catch {
        this.handleWrongSearch();
      }
    }
    if (this.path.includes("/bebidas")) {
      try {
        const { drinks } = await fetchDrinksItensById(this.params);
        drinks
          ? ((this.ObjectItem = drinks[0]), (this.isLoding = false))
          : this.handleWrongSearch();
      } catch {
        this.handleWrongSearch();
      }
    }
  },
};
</script>