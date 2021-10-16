<template>
  <h1>Item de Procura: {{ $store.state.iten_name }}</h1>
  <ul>
    <li v-for="item in $store.state.itens_result" :key="item.id">
      <img :src="item.thumbnail" :alt="item.title" />
      <p>{{ item.title }}</p>
      <p>R$: {{ item.price }}</p>
    </li>
  </ul>
</template>
<script>
export default {
  name: "MainListItem",
};
</script>