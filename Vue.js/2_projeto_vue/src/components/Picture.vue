<template>
  <img :src="avatar" :alt="descrição" class="image-avatar" >
</template>
<script>
export default {
  name: 'Picture',
  data() {
    return {
      avatar: 'https://s2.glbimg.com/_bDnKvOpodO6FkZL8zJ0BFDtyAA=/e.glbimg.com/og/ed/f/original/2020/10/30/jamie-street-utre5dcgeyg-unsplash.jpg',
      descrição: 'imagem do avatar do usuario',
    }
  }
}
</script>

<style>
  .image-avatar{
    width: 250px;
  }
</style>