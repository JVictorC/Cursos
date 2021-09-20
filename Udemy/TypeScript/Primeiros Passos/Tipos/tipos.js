"use strict";
/* String */
let nome = 'João';
console.log(nome);
/*Numbers*/
let idade = 27;
// idade = 'Ana'
// idade = 27.5
console.log(idade);
/*Boolean*/
let possuiHobbies = false;
// possuiHobbies = 1
console.log(possuiHobbies);
/* Tipos Explicitos */
let minhaIdade;
minhaIdade = 27;
console.log(typeof (minhaIdade));
// minhaIdade = 'idade é 27'
/* Arrays e Tipeos */
let hobbies = ['Cozinhar', 'Praticar Esportes'];
console.log(hobbies[0]);
console.log(typeof hobbies);
hobbies = [100];
// hobbies = 100
console.log(hobbies);
/* Tupla */
/* Array de Tipos predefinidas, controlando tipos e length */
let endereco = ['Av Principal', 99, ''];
console.log(endereco);
endereco = ['Rua importancia', 1260, 'Bloco C'];
console.log(endereco);
/* Enums */
// Valores pre-definidos
var Cor;
(function (Cor) {
    Cor[Cor["Cinza"] = 0] = "Cinza";
    Cor[Cor["Verde"] = 100] = "Verde";
    Cor[Cor["Azul"] = 2] = "Azul";
})(Cor || (Cor = {}));
let minhaCor = Cor.Verde;
console.log(minhaCor);
/* Tipo Any */
let carro = 'BMW';
console.log(carro);
carro = { marca: 'BMW', ano: 2019 };
console.log(carro);
/* Funções */
function retornaMeuNome() {
    return nome;
}
console.log(retornaMeuNome());
function digaOi() {
    console.log('Oi');
}
function multiplicar(numA, numB) {
    return numA * numB;
}
// console.log(multiplicar(2, 'Bia'));
console.log(multiplicar(2, 3));
/* Funções Como Tipos */
// const teste = function  (a: number, b: number): boolean {
//   return false
// }
let calculo;
// calculo = digaOi
// console.log(calculo());
calculo = multiplicar;
console.log(calculo(5, 6));
/* Object */
let usuario = {
    nome: 'João',
    idade: 27
};
console.log(usuario);
// usuario = {}
// usuario = {
//   name: 'Marias',
//   age: 31,
// }
usuario = {
    nome: 'Maria',
    idade: 32,
};
const dataFuncioraios = {
    supervisores: ['João', 'Carlos', 'Andre'],
    baterPonto: (horas) => {
        if (horas > 8) {
            return 'Fora de Horário';
        }
        return 'Ponto Normal';
    }
};
/* Respoosta Curso */
let funcionarios;
funcionarios = {
    supervisores: ['Ana', 'Fernando'],
    baterPonto: (horario) => {
        if (horario <= 8) {
            return 'Ponto Normal';
        }
        else {
            return 'Fora do Horário!';
        }
    }
};
/* Unio Types */
let nota = 10;
console.log(`Minha Nota é ${nota}`);
nota = '10';
console.log(`Minha Nota é ${nota}`);
// nota = true
/*Chegando Tipos*/
// é disponibilizado automatico no TypeScript
let valor = 30;
if (typeof valor === 'number') {
    console.log('É um NUmber');
}
else {
    console.log(typeof valor);
}
/* Tipo 'NEVER' */
// Quer dizer que a função nunca vai retornar
function falha(msg) {
    throw new Error(msg);
}
const produto = {
    nome: 'Sabão',
    preco: -1,
    validarProduto() {
        if (!this.nome || this.nome.trim().length === 0) {
            falha('Preciso ter um nome');
        }
        else if (this.preco <= 0) {
            falha('Preco Invalidado');
        }
    }
};
/* Tipo Null */
let altura = 12;
// altura = null
let alturaOpcional = 12;
alturaOpcional = null;
const contato1 = {
    nome: 'Fulano',
    tel1: '98765432',
    tel2: null,
};
let podeSerNulo = null;
podeSerNulo = 12;
podeSerNulo = 'ABC';
let contaBancaria = {
    saldo: 3456,
    depositar(valor) {
        this.saldo += valor;
    }
};
let correntista = {
    nome: 'Ana Silva',
    contaBancaria: contaBancaria,
    contatos: ['34567890', '98765432']
};
correntista.contaBancaria.depositar(3000);
console.log(correntista);
//# sourceMappingURL=tipos.js.map