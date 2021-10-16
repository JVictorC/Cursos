<template>
  <main>
    <h1>Item de Procura: {{ $store.state.nameIten }}</h1>
    <ul>
      <li v-for="item in $store.state.results" :key="item.id">
        <img :src="item.thumbnail" :alt="item.title" class="image-thumbnail">
        <p>{{ item.title }}</p>
        <p>{{ item.price }}</p>
      </li>
    </ul>
  </main>
</template>
<script>
export default {
  name: 'MainList'
}
</script>

<style scoped>
.image-thumbnail {
  width: 100px;
}
</style>