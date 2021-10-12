<template>
  <ul>
    <li v-for="toDo of arrayTodoList" :key="toDo">
      {{ toDo }}
    </li>
  </ul>
</template>
<script>
export default {
  name: "TodoList",
  props: {
    arrayTodoList: Array,
  },
};
</script>