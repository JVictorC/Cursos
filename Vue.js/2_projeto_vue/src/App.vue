<template>
  <h1>Ola Mundo!</h1>
  <PrimeiroComponente />
  <LifeCicle />
  <Pessoa />
</template>

<script>
import PrimeiroComponente from './components/PrimeiroComponente.vue'
import LifeCicle from './components/LifeCicle.vue'
import Pessoa from './components/Pessoa.vue'

  export default  { 
    name: 'App',
    components: {
      PrimeiroComponente,
      LifeCicle,
      Pessoa
    },
  }
</script>

<style>
  body{
    background-color: #333;
    color: #fff;
  }
</style>