<template>
  <h1>Ola Mundo!</h1>
  <PrimeiroComponente />
  <LifeCicle />
</template>

<script>
import PrimeiroComponente from './components/PrimeiroComponente.vue'
import LifeCicle from './components/LifeCicle.vue'

  export default  { 
    name: 'App',
    components: {
      PrimeiroComponente,
      LifeCicle
    },
  }
</script>