<template>
  <nav>
    <h1>Categorias</h1>
    <ul>
      <li v-for="item in listCategories" :key="item.id">
        <label :for="item.id">
          <input
            type="radio"
            name="category"
            :value="item.id"
            :id="item.id"
            @click="handleSelectCategory"
          />
          {{ item.name }}
        </label>
      </li>
    </ul>
  </nav>
</template>
<script>
import fetchCategorys from "../../service/fetchCategorys";

export default {
  name: "CategorisList",
  data() {
    return {
      listCategories: [],
    };
  },
  methods: {
    handleSelectCategory({target: {value}}) {
      this.$store.dispatch('getItensByCategory', value)
    }
  },
  async mounted() {
    const categories = await fetchCategorys();
    this.listCategories = categories;
  },
};
</script>