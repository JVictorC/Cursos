<template>
  <div class="h-screen flex items-center justify-center flex-col">
    <h1 class="text-8xl text-center text-red-600">Not Found</h1>
    <img :src="NotFound" alt="Image Not Found 404" class="w-80 h-80">
  </div>
</template>
<script>
import NotFound from '../assets/NotFound.svg'

export default {
  name: "NotFound",
  mounted() {
    this.$router.push('/notFound');
  },
    computed: {
    NotFound: {
      get: () => NotFound  
    }
  },
}
</script>