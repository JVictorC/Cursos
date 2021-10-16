<template>
  <div>
    <p v-if="esta_trabalhando">Estou trabalhando no momento.</p>
    <p v-else>Estou em busca de novas oportunidades</p>
    <p>Utilizo as seguintes tecnologias para BackEnd:</p>
    <ul>
      <li v-for="(tecnology, index) in backend_tecnologies" :key="index">
        {{ tecnology }}
      </li>
    </ul>
    <p>Utilizado no Front-end:</p>
    <ul>
      <li v-for="{ id, language } in front_techologies" :key="id">
        {{ language }}
      </li>
    </ul>
    <div>
      <button @click="showEmail">{{ textBotao }}</button>
    </div>
    <p v-show="mostrar_email">Mande uma menssagem para: {{ email }}</p>
    <p>
      Para acessar meu portifolio
      <a v-bind:href="meu_link" target="_blank">basta clicar aqui</a>
    </p>
    <Picture />
  </div>
</template>

<script>
import Picture from "./Picture.vue";

export default {
  name: "Info",
  data() {
    return {
      esta_trabalhando: true,
      mostrar_email: false,
      email: "joao@gmail.com",
      meu_link: "http://google.com",
      textBotao: "Mostrar Email",
      backend_tecnologies: ["JavaScript", "PHP", "Python"],
      front_techologies: [
        { id: 1, language: "HTML" },
        { id: 2, language: "CSS" },
        { id: 3, language: "Vue" },
      ],
    };
  },
  components: {
    Picture,
  },
  methods: {
    showEmail() {
      this.mostrar_email = !this.mostrar_email;

      this.mostrar_email
        ? (this.textBotao = "Esconder Email")
        : (this.textBotao = "Mostra Email");
    },
  },
};
</script>
