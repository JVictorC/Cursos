main() {
  var personClass = ClassDados(nome: 'João', idade: 19);

  print(mapDados['nome']);

  print(personClass.idade);
}

const mapDados = {
  'nome': 'João',
  'idade': 19,
};

class ClassDados {
  final String nome;
  final int idade;

  ClassDados({
    required this.nome,
    required this.idade
  });
}