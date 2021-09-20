
const Pessoa = {
  name: 'João',
  lastName: 'Victor',
  momName: 'Marlene',
  fatherName: undefined,
  adrres: {
    street: 'Reinaldo',
    number: '30',
    distract: 'Taboão',
  },
  nameCompleted: function () {
    return `${this.name} ${this.lastName}`
  }
}

const keysObject = (object) => Object.keys(object);

const valuesObject = (object) => Object.values(object);

const entriesObject = (object) => Object.entries(object);

const verificar = () => {
 const keys = keysObject(Pessoa)
 for (indice of keys) {
   if (indice === 'name' && Pessoa[indice] === 'João') {
     console.log('Ok');
     break;
   }
 }
}
