import 'package:flutter/material.dart';

main() => runApp(const ShoppingCart());

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.yellow[700],
            secondary: Colors.black,
          ),
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w300,
                  color: Colors.black))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: const [
          Icon(Icons.shopping_cart)
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem Vindo a Versão Playground do Mercado Livre',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Container(
              height: 300,
              width: 300,
              child: Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
