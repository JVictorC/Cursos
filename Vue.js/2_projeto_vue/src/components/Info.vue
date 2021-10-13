<template>

<div>
  <p v-if="esta_trabalhando">Estou trabalhando no momento.</p>
  <p v-else>Estou em busca de novas oportunidades</p> 
  <p>Utilizo as seguintes tecnologias</p>
  <ul>
    <li>JavaScript</li>
    <li>React</li>
    <li>Vue</li>
  </ul>
  <div>
    <button @click="showEmail">{{ textBotao }}</button>
  </div>
  <p v-show="mostrar_email">Mande uma menssagem para: {{ email }}</p>
  <p>Para acessar meu portifolio <a v-bind:href="meu_link" target="_blank">basta clicar aqui</a></p>
  <Picture />
</div>

</template>

<script>
import Picture from './Picture.vue'

export default {
  name: 'Info',
  data() {
    return {
      esta_trabalhando: true,
      mostrar_email: false,
      email: 'joao@gmail.com',
      meu_link: 'http://google.com',
      textBotao: 'Mostrar Email'
    }
  },
  components: {
    Picture,
  },
  methods: {
    showEmail() {
      this.mostrar_email = !this.mostrar_email

      this.mostrar_email ? this.textBotao = 'Esconder Email' : this.textBotao = 'Mostra Email'
    }
  }
};

</script>