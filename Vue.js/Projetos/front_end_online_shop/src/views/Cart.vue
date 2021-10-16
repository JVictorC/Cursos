<template>
  <div class="about">
    <h1 class="text-5xl my-10">Cart</h1>
    <ul class="grid grid-cols-2 gap-5">
      <li
        v-for="item in $store.state.card"
        :key="item.id"
        class="flex flex-col items-center shadow-lg my-10"
      >
        <img :src="item.thumbnail" :alt="item.title" class="w-32 h-32" />
        <p>{{ item.title }}</p>
        <p>R$: {{ item.price }}</p>
        <button 
        class="px-5 py-3 border bg-red-500 text-white my-5 hover:bg-red-600"
        @click="handleDelteItem(item.id)"
        >
          Remover Do Carrinho
        </button>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  name: "Cart",
  methods: {
    handleDelteItem(idItem) {
      const newArray = this.$store.state.card.filter((item) => item.id !== idItem)
      this.$store.commit('deleteItemCard', newArray)
    }
  }
};
</script>
