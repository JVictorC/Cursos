<template>
  <h1>Meu Nome é: {{ nome }}</h1>
</template>

<script>
export default {
  name: "LefeCicle",
  data() {
    return {
      nome: "Ainda não sei",
    };
  },
  created() {
    setTimeout(() => {
      this.nome = "João Victor";
    }, 1000);
  },
  mounted() {
    setTimeout(() => {
      this.nome = "Victor";
    }, 2000);
  },
};
</script>