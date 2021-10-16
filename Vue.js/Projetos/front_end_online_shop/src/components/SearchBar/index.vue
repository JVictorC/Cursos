<template>
  <header>
    <form @submit.prevent.stop="handleSubmitForm">
      <input
        type="text"
        placeholder="Pesquisar Item Pelo Nome"
        v-model="myItenByName"
      />
      <button type="submit" :disabled="buttosIsDisabled">Pesquisar</button>
    </form>
  </header>
</template>

<script>
export default {
  name: "SearchBar",
  data() {
    return {
      myItenByName: "",
      buttosIsDisabled: true,
    };
  },
  watch: {
    myItenByName() {
      this.myItenByName.length > 0 
      ? this.buttosIsDisabled = false
      : this.buttosIsDisabled = true
    }
  },
  methods: {
    handleSubmitForm() {
      this.$store.dispatch('getItensByName', this.myItenByName)
    }
  }
};
</script>