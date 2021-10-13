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
      toDo: '',
      index: 0,
    }
  },
  props: {
    handleNewTodoList: Function
  },
  methods: {
    handleClick(e) {
      e.preventDefault()
      this.handleNewTodoList({index: this.index, toDo: this.toDo})
      this.toDo = ''
      this.index++
    }
  }
}
</script>