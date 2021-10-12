<template>
  <div>
    <h1>Ola Vue!</h1>
    <!-- <p>Meu nome é {{ nome }} e trabalho como {{ profissional }}</p> -->
  </div>
</template>
<script>
export default {
  name: "PrimeiroComponente",
  data() {
    return {
      nome: "João Victor",
      profissional: 'Dev front end'
    };
  },
};
</script>