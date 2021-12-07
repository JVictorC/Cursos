import 'package:auth_firebase/providers/auth.dart';
import 'package:auth_firebase/providers/coins.dart';
import 'package:auth_firebase/providers/conversor_coin.dart';
import 'package:auth_firebase/providers/transactions.dart';
import 'package:auth_firebase/screens/home_or_login.dart';
import 'package:auth_firebase/screens/new_transaction.dart';
import 'package:auth_firebase/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const AuthFirebase());
}

class AuthFirebase extends StatelessWidget {
  const AuthFirebase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => Coins()),
        ChangeNotifierProvider(create: (_) => ConversorCoin()),
        ChangeNotifierProvider(create: (_) => TransActionsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(
                primary: const Color.fromRGBO(41, 50, 65, 1),
                secondary: const Color.fromRGBO(224, 251, 252, 1),
              ),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  color: Color.fromRGBO(41, 50, 65, 1),
                ),
              ),
        ),
        routes: {
          AppRoutes.HOME: (ctx) => const HomeOrLogin(),
          AppRoutes.ADD_NEW_TRANSACTION: (ctx) => const NewTransAction(),
        },
      ),
    );
  }
}
