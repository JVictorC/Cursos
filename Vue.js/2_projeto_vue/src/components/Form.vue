<template>
  <h2>Meu Formulario</h2>
  <form>
    <div>
      <InputText />
    </div>
    <div>
      <InputText />
    </div>
    <div>
      <Submit />
    </div>
  </form>
</template>
<script>
import InputText from "./Form/InputText.vue";
import Submit from "./Form/Submit.vue";
export default {
  name: "Form",
  components: {
    InputText,
    Submit,
  },
};
</script>
