<template>
  <div>
    <ul class="main-list">
      <li
        v-for="item in ArrayForMap"
        :key="item.idMeal || item.idDrink"
        class="card-item"
        @click="handleClickDirect(item.idMeal || item.idDrink)"
      >
        <img
          :src="item.strMealThumb || item.strDrinkThumb"
          :alt="item.strMeal || item.strDrink"
          class="w-1/2 h-52 rounded-lg"
        />
        <p class="text-4xl text-red-500 py-5">
          {{ item.strMeal || item.strDrink }}
        </p>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  name: "MainList",
  props: {
    ArrayForMap: [Object],
  },
    methods: {
    handleClickDirect(id) {
      const path = this.$route.path
      this.$router.push(`${path}/${id}`)
    },
  },
};
</script>
<style>
.card-item {
  @apply w-full flex flex-col items-center my-5 h-64 md:h-80 justify-between transform transition duration-500 hover:scale-110 cursor-pointer shadow-lg rounded-lg;
}
.main-list {
  @apply grid grid-cols-1 my-10 md:grid-cols-2 md:gap-16 px-5;
}
</style>