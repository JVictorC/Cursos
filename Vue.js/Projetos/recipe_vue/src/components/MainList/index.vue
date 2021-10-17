<template>
      <div>
      <ul class="grid grid-cols-1 my-10 md:grid-cols-2">
        <li
          v-for="item in ArrayForMap"
          :key="item.idMeal"
          class="w-full flex flex-col items-center my-5 h-64 justify-between"
        >
          <img
            :src="item.strMealThumb"
            :alt="item.strMeal"
            class="w-1/2 h-52 rounded-lg"
          />
          <p class="text-4xl text-red-500 py-5">{{ item.strMeal }}</p>
        </li>
      </ul>
    </div>
</template>
<script>
export default {
  name: 'MainList',
  props: {
    ArrayForMap: [Object]
  },
}
</script>