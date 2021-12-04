import 'package:auth_firebase/providers/auth.dart';
import 'package:auth_firebase/screens/home_or_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AuthFirebase());
}

class AuthFirebase extends StatelessWidget {
  const AuthFirebase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: const Color.fromRGBO(134, 47, 87, 1),
          secondary: const Color.fromRGBO(214, 143, 175, 1),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: const TextStyle(
            color: Color.fromRGBO(134, 47, 87, 1)
          )
        )
      ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Auth())
          ],
          child: const HomeOrLogin(),
        ),
    );
  }
}