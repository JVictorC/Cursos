<template>
  <div>
    <h1>Ola Vue!</h1>
    <p>Meu nome é {{ nome }} e trabalho como {{ profissional }}</p>
    <MultiplosEventos />
  </div>
</template>
<script>
import MultiplosEventos from './MultiplosEventos.vue'
export default {
  name: "PrimeiroComponente",
  data() {
    return {
      nome: "João Victor",
      profissional: 'Dev front end'
    };
  },
  components: {
    MultiplosEventos,
  }
};
</script>