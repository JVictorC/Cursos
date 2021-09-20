let canal: string = 'Gaveta'
let inscritos: number = 610234

// canal = inscritos
console.log(`Canal = ${canal}`);

nome = 'Pedro'


function soma (a: any,b: any) {
  return a +b
}

let qualquerCoisa: number | string

qualquerCoisa = 12
qualquerCoisa = 'Abc'


function saudar (isMnha: boolean): string {
  let saudacao: string
  // let a = 1
  if(isMnha) {
    saudacao = 'Bom dia!'
  } else {
    saudacao = 'Tenha Uma boa Vida!'
  }

  return saudacao
}