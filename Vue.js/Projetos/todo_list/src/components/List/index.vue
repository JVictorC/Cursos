<template>
  <ul class="container-list">
    <li v-for="toDo of arrayTodoList" :key="toDo" class="list">
      {{ toDo.toDo }}
      <button v-on:click="handleClickDelete(toDo.index)">Exluir Tarefa</button>
    </li>
  </ul>
</template>
<script>
export default {
  name: "TodoList",
  props: {
    arrayTodoList: Array,
    handleDeleteToDo: Function,
  },
  methods: {
    handleClickDelete(i) {
      const newArray = this.arrayTodoList.filter(({index}) => index !== i)
      this.handleDeleteToDo(newArray);
    }
  }
};
</script>
