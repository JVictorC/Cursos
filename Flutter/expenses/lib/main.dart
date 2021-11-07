import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import './components/chart.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
    Transaction(id: '0', title: 'title', value: 0.0, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
          (element) => element.date.isAfter(DateTime.now().subtract(
            Duration(days: 7),
          )),
        )
        .toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(
          onSubmit: _addTransaction,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(fontSize: 20 * MediaQuery.of(context).textScaleFactor),
      ),
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: Icon(Icons.add),
        )
      ],
    );
    final availabelHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: availabelHeight * 0.3,
              child: Chart(recentTransaction: _recentTransactions),
            ),
            Container(
              height: availabelHeight * 0.7,
              child: TransactionList(_transactions, _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
