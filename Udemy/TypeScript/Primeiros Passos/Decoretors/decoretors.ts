// @logarClass
@logarClasseSe(true)

// class Eletrodomestico {
//   constructor() {
//     console.log('novo ...');
//   }
// }

function logarClass (construtor: Function) {
  console.log(construtor);
}

function logarClasseSe (valor: boolean) {
  return valor ? logarClass : null
}
