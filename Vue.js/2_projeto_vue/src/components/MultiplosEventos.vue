<template>
  <div>
    <button @click="primeiro($event), segundo($event)">Ativar múltiplos eventos</button>
    <p>{{ multiplos_eventos }}</p>
  </div>
</template>
<script>
export default {
  name: "MultiplosEventos",
  data() {
    return {
      multiplos_eventos: ''
    }
  },
  methods: {
    primeiro(e) {
      this.multiplos_eventos = "Primeiro Evento Ativaado!"
    },
    segundo(e) {
      setTimeout(() => {
        this.multiplos_eventos = "Segundo Evento"
      }, 500)
    }
  }
};
</script>
<style scoped>
div {
  margin: 100px;
}
</style>