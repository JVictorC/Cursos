@logarClass

class Eletrodomestico {
  constructor() {
    console.log('novo ...');
  }
}

function logarClass (construtor: Function) {
  console.log(construtor);
}

new Eletrodomestico()
new Eletrodomestico()
new Eletrodomestico()