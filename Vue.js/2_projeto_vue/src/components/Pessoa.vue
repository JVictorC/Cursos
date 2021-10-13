<template>
  <div>
    <h2>Esta é a descrição da pessoa: {{ nome }}</h2>
    <Info />
    <Form />
  </div>
</template>
<script>
import Info from "./Info.vue";
import Form from "./Form.vue";

export default {
  name: "Pessoa",
  data() {
    return {
      nome: "João",
    };
  },
  components: {
    Info,
    Form,
  },
};
</script>