import 'package:flutter/material.dart';
import 'package:shop_udemy/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final providerState = CounterProvider.of(context)?.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Contador'),
      ),
      body: Column(
        children: [
          Text('${providerState?.value}'),
          IconButton(
            onPressed: () {
              setState(() {
                providerState?.increment();
              });
              print(providerState?.value);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                providerState?.decremento();
              });
              print(providerState?.value);
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
