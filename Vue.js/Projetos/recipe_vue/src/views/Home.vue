<template>
  <div class="home">
      <router-view />
    <Footer />
  </div>
</template>

<script>
import Footer from '../components/Footer'

export default {
  name: 'Home',
  components: {
    Footer,
  },
  data() {
    return {
      path: this.$route.href
    }
  }
}
</script>
