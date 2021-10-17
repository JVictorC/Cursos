<template>
  <footer
    class="border flex justify-around bottom-0 fixed w-full h-16 items-center bg-white"
  >
    <font-awesome-icon
      icon="wine-glass"
      class="text-4xl text-red-500 cursor-pointer"
      @click="handleClickDirect('/bebidas')"
    />
    <font-awesome-icon
      icon="compass"
      class="text-4xl text-red-500 cursor-pointer"
      @click="handleClickDirect('/explorar')"
    />
    <font-awesome-icon
      icon="hamburger"
      class="text-4xl text-red-500 cursor-pointer"
      @click="handleClickDirect('/comidas')"
    />
  </footer>
</template>
<script>
export default {
  name: 'Footer',
  methods: {
    handleClickDirect(local) {
      this.$router.push(local)
    }
  }
}
</script>