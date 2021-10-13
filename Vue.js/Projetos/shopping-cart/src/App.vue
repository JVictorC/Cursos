<template>
  <div class="container">
    <SearchBar :getItemBySearch="getItemBySearch" />
    <div class="container-main-products">
      <ListProducts v-if="hasSearch" :itemForSearch="itemForSearch" :handleAddProductsInCard="handleAddProductsInCard"/>
      <Cart v-if="hasSearch" :listCart="listCart" :handleDeleteItemCart="handleDeleteItemCart"/>
    </div>
  </div>
</template>

<script>
import SearchBar from "./components/SearchBar";
import ListProducts from "./components/ListProducts";
import Cart from "./components/Cart";

export default {
  name: "App",
  data() {
    return {
      itemForSearch: "",
      hasSearch: false,
      listCart: [],
    };
  },
  components: {
    SearchBar,
    ListProducts,
    Cart,
  },
  methods: {
    getItemBySearch(nameItem) {
      this.hasSearch = false
      this.itemForSearch = nameItem;
      this.hasSearch = true;
    },
    handleAddProductsInCard(newProduct) {
      const newArray = [...this.listCart, newProduct]
      this.listCart = newArray
    },
    handleDeleteItemCart(newArray) {
      this.listCart = newArray
    }
  },
};
</script>

<style>
.container {
  display: flex;
  flex-flow: column wrap;
  align-items: center;
}

.container-main-products {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
}

</style>
