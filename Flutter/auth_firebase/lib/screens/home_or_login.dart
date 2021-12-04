import 'package:auth_firebase/providers/auth.dart';
import 'package:auth_firebase/screens/home_page.dart';
import 'package:auth_firebase/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

    return auth.isAuth ? const HomePage() : const LoginPage();
  }
}