<template>
  <main class="col-span-2 flex flex-col items-center gap-3">
    <h1 class="my-5" v-if="$store.state.nameIten">
      Item de Procura: {{ $store.state.nameIten }}
    </h1>
    <ul class="grid grid-cols-3 gap-10">
      <li
        v-for="item in $store.state.results"
        :key="item.id"
        class="
          shadow-md
          flex flex-col
          items-center
          text-center
          justify-around
          transform
          hover:scale-110
          transition
          duration-500
          py-10
        "
      >
        <img :src="item.thumbnail" :alt="item.title" class="image-thumbnail" />
        <p>{{ item.title }}</p>
        <p>R$:{{ item.price }}</p>
        <button
          class="
            border
            bg-blue-500
            hover:bg-blue-700
            transform
            transition
            duration-300
            text-white
            py-3
            px-5
            mt-5
          "
          @click="handleAddProductCart(item)"
        >
          Adicionar Ao Carrinho
        </button>
      </li>
    </ul>
  </main>
</template>
<script>
export default {
  name: "MainList",
  methods: {
    handleAddProductCart(product) {
      this.$store.commit('AddProducTCart', product)
    }
  }
};
</script>

<style scoped>
.image-thumbnail {
  width: 100px;
}
</style>