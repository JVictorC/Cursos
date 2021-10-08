"use strict";
// function echo (object: any): any {
//   return object
// }
// console.log(echo('João'));
// console.log(echo(27));
// console.log(echo({nome: 'João', idade: 27}));
function echoMelhorado(objeto) {
    return objeto;
}
console.log(echoMelhorado('João').length);
console.log(echoMelhorado(27));
console.log(echoMelhorado({ nome: 'João', idade: 27 }));
// Generics disponiveis na API
const avalicoes = [10, 9.3, 7.7];
avalicoes.push(8.4);
// avalicoes.push('5.5')
console.log(avalicoes);
function imprimir(args) {
    args.forEach((element) => console.log(element));
}
imprimir([1, 2, 3]);
imprimir([1, 2, 3]);
imprimir(['Ana', 'Bia', 'Carlos']);
imprimir([
    { nome: 'Fulano', idade: 22 },
    { nome: 'Cicrano', idade: 23 },
    { nome: 'Beltrano', idade: 24 },
]);
// tipo Generio
const chamarEcho = echoMelhorado;
console.log(chamarEcho('Alguma coisa'));
// Class com Generics
class OperacaoBinaria {
    constructor(operando1, operado2) {
        this.operando1 = operando1;
        this.operado2 = operado2;
    }
}
// console.log(new OperacaoBinaria('Bom', 'Dia').executar());
// console.log(new OperacaoBinaria(3, 7).executar());
// console.log(new OperacaoBinaria(3, 'Opa').executar());
class somaBinaria extends OperacaoBinaria {
    executar() {
        return this.operando1 + this.operado2;
    }
}
console.log(new somaBinaria(3, 4).executar());
//# sourceMappingURL=genericos.js.map