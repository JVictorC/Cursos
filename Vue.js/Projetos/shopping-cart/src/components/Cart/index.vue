<template>
  <div class="container-main-cart">
    <h1>Cart</h1>
    <ul>
      <li v-for="item in listCart" :key="item.id" class="item">
        <p>{{item.title}}</p>
        <p>R$: {{item.price}}</p>
        <button @click="handleClickDelete(item.id)">Remover Item</button>
      </li>
    </ul>
    <p>Total: R$: {{ total }}</p>
  </div>
</template>
<script>
export default {
  name:  'Cart',
  props: {
    listCart: Array,
    handleDeleteItemCart: Function
  },
  methods: {
    handleClickDelete(idForDelete) {
      const newArray = this.listCart.filter(({id}) => id !== idForDelete)
      this.handleDeleteItemCart(newArray)
    },
    handleWithTotal() {
      const total = this.listCart.reduce((acc, {price}) => (
        acc += price
      ), 0);
      this.total = parseFloat(total).toFixed(2)
    }
  },
  updated() {
    this.handleWithTotal()
  },
  data() {
    return {
      total: 0
    }
  }
}
</script>
<style>
.container-main-cart{
  width: 25%;
  display: flex;
  flex-flow: column wrap;
  justify-content: center;
  align-items: center;
}
.item {
  display: flex;
  flex-flow: column wrap;
  align-items: center;
  justify-content: center;
}
</style>