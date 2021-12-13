
export default class PortaModel {
  // # diz que é um atributo privado
  #numero: number;
  #temPresente: boolean;
  #selecionada: boolean;
  #aberta: boolean;

  get numero() {
    return this.#numero
  }
  get temPresente() {
    return this.#temPresente
  }

  get selecionada() {
    return this.#selecionada
  }

  get aberta() {
    return this.#aberta
  }


  desSelecionar() {
    const selecionada = false;
    return new PortaModel(
      this.numero, this.temPresente, selecionada, this.aberta
    )
  }

  alternarSelecao() {
    const selecionada = !this.selecionada;
    return new PortaModel(
      this.numero, this.temPresente, selecionada, this.aberta
    )
  }

  abrir() {
    const aberta = true;
    return new PortaModel(
      this.numero, this.temPresente, this.selecionada, aberta
    );
  }

  constructor(numero: number, temPresente = false, selecionada = false, aberta = false) {
    this.#numero = numero;
    this.#temPresente = temPresente;
    this.#selecionada = selecionada;
    this.#aberta = aberta;
  }

}