class Data {
  dia: number
  mes: number
  ano: number
  constructor(dia: number = 1, mes: number = 1, ano: number = 1970) {
    this.dia = dia
    this.mes - mes
    this.ano = ano
  }
}

const aniversario = new Data(3, 11, 1991)

aniversario.dia = 4

console.log(aniversario.dia);

const casamento = new Data 

casamento.ano = 2017

console.log(casamento);


class DataEsperta {
  constructor(public dia: number = 1, public mes: number = 1, public ano: number = 1970) {
  }
}

const aniversarioEsperto = new DataEsperta(3, 11, 1991)

aniversarioEsperto.dia = 4

console.log(aniversarioEsperto.dia);

const casamentoEsperto = new DataEsperta 

casamentoEsperto.ano = 2017

console.log(casamentoEsperto);


/* 
Desafio Classe Produto

Atributos: nome, preco e desconto

Criar o construtor

Obs1.: Desconto é opional (valor padrão 0)

Obs 2.: Criar dois produtos: passando dois e três params
*/

class Produto {
  constructor(public nome: string, public preco: number,public desconto: number = 0) {}
}

const lapis = new Produto('lapis', 1)

const caderno = new Produto('caderno', 10, .5)