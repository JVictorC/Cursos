"use strict";
class Data {
    constructor(dia = 1, mes = 1, ano = 1970) {
        this.dia = dia;
        this.mes - mes;
        this.ano = ano;
    }
}
const aniversario = new Data(3, 11, 1991);
aniversario.dia = 4;
console.log(aniversario.dia);
const casamento = new Data;
casamento.ano = 2017;
console.log(casamento);
class DataEsperta {
    constructor(dia = 1, mes = 1, ano = 1970) {
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    }
}
const aniversarioEsperto = new DataEsperta(3, 11, 1991);
aniversarioEsperto.dia = 4;
console.log(aniversarioEsperto.dia);
const casamentoEsperto = new DataEsperta;
casamentoEsperto.ano = 2017;
console.log(casamentoEsperto);
/*
Desafio Classe Produto

Atributos: nome, preco e desconto

Criar o construtor

Obs1.: Desconto é opional (valor padrão 0)

Obs 2.: Criar dois produtos: passando dois e três params
*/
class Produto {
    constructor(nome, preco, desconto = 0) {
        this.nome = nome;
        this.preco = preco;
        this.desconto = desconto;
    }
}
const lapis = new Produto('lapis', 1);
const caderno = new Produto('caderno', 10, .5);
//# sourceMappingURL=classes.js.map