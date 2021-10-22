class Produto {
  String? nome;
  double? preco;


  Produto({this.nome = 'arroz', this.preco = 0.99});

  // Produto(String nome, double preco) {
  //   this.nome = nome;
  //   this.preco = preco;
  // }

}

void soma(int a, int b) => print(a + b);
main() {
  var p1 = Produto(nome:'Lapis', preco: 4.59);
  var p2 = Produto(nome:'Geladeira', preco: 1454.99);
  var p3 = Produto();

  print('o produto ${p1.nome} tem o preço ${p1.preco}');
  print('o produto ${p2.nome} tem o preço ${p2.preco}');
  print('o produto ${p3.nome} tem o preço ${p3.preco}');
  

  soma(5, 1);
}
