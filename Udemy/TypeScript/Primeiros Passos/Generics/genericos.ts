// function echo (object: any): any {
//   return object
// }

// console.log(echo('João'));
// console.log(echo(27));
// console.log(echo({nome: 'João', idade: 27}));

function echoMelhorado<T>(objeto: T): T {
  return objeto
}



console.log(echoMelhorado<string>('João').length);
console.log(echoMelhorado<number>(27));
console.log(echoMelhorado({nome: 'João', idade: 27}));

// Generics disponiveis na API

const avalicoes: Array<number> = [10, 9.3,7.7]

avalicoes.push(8.4)
// avalicoes.push('5.5')

console.log(avalicoes);

function imprimir<T> (args: T[]) {
  args.forEach((element) => console.log(element) )
}

imprimir([1,2,3])
imprimir<number>([1,2,3])
imprimir<string>(['Ana','Bia','Carlos'])

type iAluno = {
  nome: string;
  idade: number;
}

imprimir<iAluno>([
  {nome: 'Fulano', idade: 22},
  {nome: 'Cicrano', idade: 23},
  {nome: 'Beltrano', idade: 24},
])

// tipo Generio

const chamarEcho: <T>(data:T) => T = echoMelhorado

console.log(chamarEcho<string>('Alguma coisa'));

// Class com Generics

abstract class OperacaoBinaria<T, R> {
  constructor(public operando1: T, public operado2: T) {}

  abstract executar(): R

}

// console.log(new OperacaoBinaria('Bom', 'Dia').executar());
// console.log(new OperacaoBinaria(3, 7).executar());
// console.log(new OperacaoBinaria(3, 'Opa').executar());

class somaBinaria extends OperacaoBinaria<number, number> {
  executar():number {
    return this.operando1 + this.operado2
  }
}

console.log(new somaBinaria(3, 4).executar());