<template>
  <form>
    <input type="text" v-model="toDo" placeholder="Digite Sua tarefa">
    <button type="submit" v-on:click="handleClick">Adicionar</button>
  </form>
</template>
<script>
export default {
  name: 'Form',
  data() {
    return {
      toDo: ''
    }
  },
  props: {
    handleNewTodoList: Function
  },
  methods: {
    handleClick(e) {
      e.preventDefault()
      this.handleNewTodoList(this.toDo)
      this.toDo = ''
    }
  }
}
</script>