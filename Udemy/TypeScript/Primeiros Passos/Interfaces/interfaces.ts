interface Humano {
  nome: string
  idade?: number
  [prop: string]: any 
}


function saudarComOla (pesssoa: Humano) {
  console.log(`Ola ${pesssoa.nome}`);
}


function mudarNome (pessoa: Humano) {
  pessoa.nome ='Joana'
}

const pessoa = {
  nome: 'João',
  idade: 27
}

saudarComOla(pessoa)
mudarNome(pessoa)
saudarComOla(pessoa)
saudarComOla({nome: 'Jonas', idade: 27, altura: 1.75})


interface FuncaCalculo {
  (a: number, b: number): number
}

let potencia: FuncaCalculo = (base, exp) => base ** exp

interface A {
  a(): void
}

interface B {
  b(): void
}

interface ABC extends A, B {
  c(): void
}

class RealA implements A {
  a() {}
}

class RealAB implements A,B {
  a() {}
  b() {}
}

class RealABC implements ABC {
  a() {}
  b() {}
  c() {}
}


interface Object {
  log(): void
}

Object.prototype.log = function() {
  console.log(this.toString());
}

const x = 2
const y = 3
const z = 4

x.log();
y.log();
z.log()