<template>
  <div class="container-main-list">
    <h1>Sua Procura</h1>
    <p v-show="isLoading">Carregando Procura ...</p>
    <ul class="list-main">
      <li
        v-for="item in itensForRender"
        :key="item.id"
        class="card-item"
        @click="handleAddProductsInCard(item)"
      >
        <img :src="item.thumbnail" :alt="item.title" class="card-image" />
        <p>{{ item.title }}</p>
        <p>R$ {{ item.price }}</p>
        <p>Clique para Adicionar ao Carrinho</p>
      </li>
    </ul>
  </div>
</template>
<script>
import fetchItemByName from "../../services/fetchItemByName.js";

export default {
  name: "ListProducts",
  data() {
    return {
      itensForRender: [],
      isLoading: true,
    };
  },
  props: {
    itemForSearch: String,
    handleAddProductsInCard: Function,
  },
  methods: {
    async fetchItens() {
      const result = await fetchItemByName(this.itemForSearch);
      this.itensForRender = [...result.results];
      this.isLoading = false;
    },
  },
  watch: {
    itemForSearch() {
      this.itensForRender = [];
      this.isLoading = true;
      this.fetchItens();
    },
  },
  mounted() {
    this.fetchItens();
  },
};
</script>

<style>
.list-main {
  display: flex;
  flex-flow: row wrap;
}
.card-item {
  margin: 1rem;
  width: 250px;
  height: 250px;
  text-align: center;
  display: flex;
  flex-flow: column nowrap;
  align-items: center;
  justify-content: center;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  border-radius: 20px;
  transition: 0.5s;
  cursor: pointer;
}

.card-item:hover {
  transform: scale(1.1);
}
.card-image {
  width: 80px;
  height: 80px;
}
.container-main-list {
  width: 70%;
  display: flex;
  flex-flow: column wrap;
  align-items: center;
}
</style>