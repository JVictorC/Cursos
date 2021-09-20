"use strict";
// Let & Const
let seraQuePode = '?';
console.log(seraQuePode);
let estaFrio = true;
if (estaFrio) {
    let acao = 'Colocar o Casaco!';
    console.log(acao);
}
const cpf = '789.101.132-78';
//  cpf = '123.456.000-99'
console.log(cpf);
function revelar() {
    var segredo = 'interno';
    console.log(segredo);
}
// Arrow Functions
function somar(n1, n2) {
    return n1 + n2;
}
console.log(somar(2, 2));
const subtrair = (n1, n2) => n1 - n2;
console.log(subtrair(2, 3));
const saudacao = () => console.log('Olá');
console.log(saudacao());
const falarCom = (pessoa) => console.log(`Ola ${pessoa}`);
// this
// function normalComThis () {
//   console.log(this);
// }
// const normalComThisEspecial = normalComThis.bind(2)
// normalComThisEspecial()
// const arrowComThis = () => console.log(this);
// console.log(arrowComThis());
// Default Parameter
function contageRegressiva(inicio = 3) {
    while (inicio > 0) {
        inicio--;
        console.log(inicio);
    }
    console.log('Fim');
}
contageRegressiva();
// Rest & Spread
const numbers = [1, 10, 99, -5];
console.log(Math.max(...numbers));
function retornaArray(...args) {
    return args;
}
const numeros = retornaArray(1, 2, 3, 4, 5, 6, 345, 623);
console.log(numeros);
// REst & Spread (Tupla)
const tupla = [1, 'abc', false];
function tuplaParam1(a, b, c) {
    console.log(`1) ${a} $b} ${c}`);
}
tuplaParam1(...tupla);
function tuplaParam2(...params) {
    console.log(Array.isArray(params));
    console.log(`2) ${params[0]} ${params[1]} ${params[2]}`);
}
tuplaParam2(...tupla);
// Destructuriong (array)
const caracteristicas = ['Motor Zetex 1.8', 2020];
// const moto = caracteristicas[0]
// const ano = caracteristicas[1]
const [moto, ano] = caracteristicas;
// Destructuriong (Object)
const item = {
    nome: 'SSD 480gb',
    preco: 200
};
// const nomeItem = item.nome
// const preco = item.preco
const { nome: nomeItem, preco } = item;
// Template
const usuarioId = 'SuporteCod3r';
const notificacoes = '9';
// const boaVindas = 'Boas Vindas ' + usuarioId + 'Notificações: ' + notificacoes
const boasVindas = `Boas VIndas ${usuarioId},
Notificações: ${parseInt(notificacoes)}`;
console.log(boasVindas);
// Desafio 1
/*
Abaixo temos um código em JavaScript. "Traduza-o" para TypeScript!

var dobro = function(valor) {
return valor * 2
}

console.log(dobro(10))*/
const dobro = (valor) => valor * 2;
console.log(dobro(10));
/*

Verifique se há espaço para melhorias nesse trecho de código!
var dizerOla = function (nome) {
if (nome === undefined) { nome = "Pessoa" }
console.log("Ola, " + nome)
}
dizerOla()
dizerOla("Anna")

*/
const dizerOla = (nome = "Pessoa") => console.log(`Ola ${nome}`);
dizerOla();
dizerOla("Anna");
/*
Dado esse array, imprima o menor valor!

var nums = [-3, 33, 38, 5]
console.log('???')


*/
const nums = [-3, 33, 38, 5];
console.log(Math.min(...nums));
/*

Adicione os elementos de nums em array !
var nums = [-3, 33, 38, 5]
var array = [55, 20]
console.log(array)

*/
const nums2 = [-3, 33, 38, 5];
const array = [55, 20, ...nums2];
// array = [...array, ...nums2]
console.log(array);
/*

Simplifique os trechos de código abaixo utilizando o operador
Destructuring!
var notas = [8.5, 6.3, 9.4]
var notas1 = notas[0]
var notas2 = notas[1]
var notas3 = notas[2]
console.log(nota1, nota2, nota3)
var cientista = {primeiroNome: "Will", experiencia: 12}
var primeiroNome = cientista.primeiroNome
var experiencia = cientista.experiencia
console.log(primeiroNome, experiencia)
*/
const notas = [8.5, 6.3, 9.4];
const [nota1, nota2, nota3] = notas;
console.log(nota1, nota2, nota3);
const cientista = { primeiroNome: "Will", experiencia: 12 };
const { primeiroNome, experiencia } = cientista;
console.log(primeiroNome, experiencia);
//# sourceMappingURL=ecmascript.js.map