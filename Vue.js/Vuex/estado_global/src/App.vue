<template>
  <p>{{ $store.state.user }}</p>
  <input type="text" v-model="myName">
  <button @click.prevent.stop="save()">Mudar User</button>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      myName: ''
    }
  },
  methods: {
    save() {
      // Action
      // this.$store.dispatch('saveUser', this.myName);
      // Mutation
      this.$store.commit('saveUser', this.myName)
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
