<template>
  <div class="container">
    <h1>Todo List</h1>
    <Form :handleNewTodoList="handleNewTodoList" />
    <TodoList :arrayTodoList="arrayTodoList" :handleDeleteToDo="handleDeleteToDo"/>
  </div>
</template>

<script>
import TodoList from "./components/List";
import Form from "./components/Form";

export default {
  name: "App",
  components: {
    TodoList,
    Form,
  },
  data() {
    return {
      arrayTodoList: [],
    };
  },
  methods: {
    handleNewTodoList(newTodo) {
      const newArray = [...this.arrayTodoList, newTodo];
      this.arrayTodoList = newArray;
    },
    handleDeleteToDo(newArray) {
      this.arrayTodoList = newArray
    }
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
}
</style>
