<template>
  <div>
    <h1>Login</h1>
    <form @submit.prevent.stop="handleClickLogar">
      <input type="text" class="input" v-model="myEmail" />
      <input type="password" class="input" v-model="myPassWord" />
      <button class="btn" type="submit" :disabled="disabledButton">
        Logar
      </button>
    </form>
  </div>
</template>
<script>


export default {
  name: "Login",
  data() {
    return {
      myEmail: "",
      myPassWord: "",
      validationEmail: false,
      validationPassword: false,
      disabledButton: true,
    };
  },
  watch: {
    myEmail() {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      this.validationEmail = re.test(this.myEmail);
      this.validedButton();
    },
    myPassWord() {
      this.myPassWord.length > 6
        ? (this.validationPassword = true)
        : (this.validationPassword = false);
      this.validedButton();
    },
  },
  methods: {
    validedButton() {
      if (this.validationEmail && this.validationPassword) {
        this.disabledButton = false;
      } else {
        this.disabledButton = true;
      }
    },
    handleClickLogar() {
      this.$store.commit('saveUser', this.myEmail)
      this.$router.push('/home')
    },
  },
};
</script>