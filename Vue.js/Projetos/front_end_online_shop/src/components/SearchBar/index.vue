<template>
  <header class="flex w-full items-center top-0 fixed bg-white pb-10 z-50">
    <form @submit.prevent.stop="handleSubmitForm" class="flex justify-center w-4/5">
      <input
        type="text"
        placeholder="Pesquisar Item Pelo Nome"
        v-model="myItenByName"
        class="border rounded py-2 mx-5 w-1/2 pl-10"
      />
      <button
        type="submit"
        :disabled="buttosIsDisabled"
        class="border py-3 px-5 bg-green-400 text-white hover:bg-green-600 transform transition hover:text-xl"
      >
        Pesquisar
      </button>
    </form>
    <router-link to="/cart" class="flex items-center justify-around w-2/12">
    <img src="./../../assets/Images/cart.png" alt="images cart" class="w-20 h-20">
    <p class="text-3xl">{{ $store.state.card.length }}</p>
    </router-link>
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
        ? (this.buttosIsDisabled = false)
        : (this.buttosIsDisabled = true);
    },
  },
  methods: {
    handleSubmitForm() {
      this.$store.dispatch("getItensByName", this.myItenByName);
      this.myItenByName = ''
    },
  },
};
</script>