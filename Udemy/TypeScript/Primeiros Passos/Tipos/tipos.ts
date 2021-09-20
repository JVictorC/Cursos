/* String */
let nome: string = 'João';
console.log(nome);


/*Numbers*/

let idade: number = 27

// idade = 'Ana'

// idade = 27.5

console.log(idade);


/*Boolean*/

let possuiHobbies: boolean = false

// possuiHobbies = 1

console.log(possuiHobbies);


/* Tipos Explicitos */

let minhaIdade: number

minhaIdade = 27

console.log(typeof(minhaIdade));

// minhaIdade = 'idade é 27'

/* Arrays e Tipeos */

let hobbies: any[] = ['Cozinhar', 'Praticar Esportes']

console.log(hobbies[0]);
console.log(typeof hobbies);

hobbies = [100]

// hobbies = 100

console.log(hobbies);


/* Tupla */

/* Array de Tipos predefinidas, controlando tipos e length */

let endereco: [string, number, string] = ['Av Principal', 99, '']

console.log(endereco);

endereco = ['Rua importancia', 1260, 'Bloco C']

console.log(endereco);


/* Enums */

// Valores pre-definidos


enum Cor {
  Cinza,
  Verde = 100,
  Azul = 2,
}

let minhaCor: Cor = Cor.Verde

console.log(minhaCor);


/* Tipo Any */

let carro: any = 'BMW'

console.log(carro);

carro = {marca: 'BMW', ano: 2019}

console.log(carro);


/* Funções */

function retornaMeuNome (): string {
  return nome
}

console.log(retornaMeuNome());


function digaOi (): void {
  console.log('Oi');
}

function multiplicar (numA: number,  numB: number): number {
  return numA * numB
}

// console.log(multiplicar(2, 'Bia'));

console.log(multiplicar(2, 3));


/* Funções Como Tipos */

// const teste = function  (a: number, b: number): boolean {
//   return false
// }


let calculo: (numA: number, numB: number) => number 

// calculo = digaOi

// console.log(calculo());

calculo = multiplicar

console.log(calculo(5,6));

/* Object */

let usuario: {nome: string, idade: number} = {
  nome: 'João',
  idade: 27
}


console.log(usuario);

// usuario = {}

// usuario = {
//   name: 'Marias',
//   age: 31,
// }

usuario = {
  nome: 'Maria',
  idade: 32,
}


// Desafio

/* 
  Criar um objeto funcionário com:
  - Array de strings com os nomes dos supervisores
  - Função de bater ponto que reebe a hora (número)
    e retorna uma string
    --> Ponto normal (<=8)
    --> Fora do horário(> 8)
*/

/* Minha resposta */

/*Alias*/
type Funcionario = {
  supervisores: string[],
  baterPonto: (horas: number) => string
}

const dataFuncioraios: Funcionario = {
  supervisores: ['João', 'Carlos', 'Andre'],
  baterPonto: (horas) => {
    if(horas > 8) {return 'Fora de Horário'}
    return 'Ponto Normal'
  }
} 

/* Respoosta Curso */

let funcionarios: Funcionario

funcionarios = {
  supervisores: ['Ana', 'Fernando'],
  baterPonto: (horario: number): string => {
    if (horario <= 8) {
      return 'Ponto Normal'
    } else {
      return 'Fora do Horário!'
    }
  }
}


/* Unio Types */

let nota: number | string = 10

console.log(`Minha Nota é ${nota}`);

nota = '10'

console.log(`Minha Nota é ${nota}`);

// nota = true


/*Chegando Tipos*/


// é disponibilizado automatico no TypeScript


let valor = 30

if (typeof valor === 'number') {
  console.log('É um NUmber');
} else {
  console.log(typeof valor);
}

/* Tipo 'NEVER' */

// Quer dizer que a função nunca vai retornar


function falha (msg: string): never {
  throw new Error(msg)
}

const produto = {
  nome: 'Sabão',
  preco: -1,
  validarProduto() {
    if(!this.nome || this.nome.trim().length === 0) {
      falha('Preciso ter um nome')
    } else if (this.preco <=0) {
      falha('Preco Invalidado')
    }

  }
}

/* Tipo Null */

let altura = 12
// altura = null

let alturaOpcional: null | number = 12
alturaOpcional= null

type Contato = {
  nome: string,
  tel1: string,
  tel2: string | null,
}

const contato1: Contato = {
  nome: 'Fulano',
  tel1: '98765432',
  tel2: null,
}

let podeSerNulo = null
podeSerNulo = 12
podeSerNulo= 'ABC'


// Desafio

type ContaBancaria = {
  saldo: number,
  depositar: (valor: number) => void
}


let contaBancaria: ContaBancaria = {
  saldo: 3456,
  depositar(valor: number) {
      this.saldo += valor
  }
}

type Correntita = {
  nome: string,
  contaBancaria: ContaBancaria,
  contatos: string[]
}


let correntista: Correntita = {
  nome: 'Ana Silva',
  contaBancaria: contaBancaria,
  contatos: ['34567890', '98765432']
}

correntista.contaBancaria.depositar(3000)
console.log(correntista)