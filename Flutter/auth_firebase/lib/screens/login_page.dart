// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:auth_firebase/components/form_login.dart';
import 'package:flutter/material.dart';

enum MethodAuth { SingIn, SingUp }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MethodAuth method = MethodAuth.SingIn;

  bool get _isSingIn => method == MethodAuth.SingIn;

  bool get _isSignUp => method == MethodAuth.SingUp;

  void _toggleMethod(MethodAuth newMethod) {
    setState(() {
      method = newMethod;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _avaliableScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(179, 89, 130, 1),
                  Color.fromRGBO(214, 143, 175, 1)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 50,
                  ),
                  transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Pagina Login',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  width: _avaliableScreen * .8,
                  height: _isSignUp ? 300 : 250,
                  child: FormLogin(
                    isSignUp: _isSignUp,
                    isSingIn: _isSingIn,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    _toggleMethod(
                        _isSingIn ? MethodAuth.SingUp : MethodAuth.SingIn);
                  },
                  child: Text(
                    _isSingIn ? 'Fazer Cadastro ?' : 'Fazer Login ?',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
