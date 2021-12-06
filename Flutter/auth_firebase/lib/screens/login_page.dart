// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:auth_firebase/components/form_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final _avaliableScreenWidth = MediaQuery.of(context).size.width;
    final _avaliableScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: _avaliableScreenHeight - MediaQuery.of(context).viewInsets.bottom + 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(61, 90, 128, 1),
                    Color.fromRGBO(227, 251, 252, 1)
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
            Positioned(
              bottom: .5,
              left: .5,
              top: .5,
              right: .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 70,
                      vertical: 30,
                    ),
                    transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.monetization_on,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: _avaliableScreenWidth * .8,
                    height: _isSignUp ? 350 : 250,
                    child: FormLogin(
                      isSignUp: _isSignUp,
                      isSingIn: _isSingIn,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      _toggleMethod(
                        _isSingIn ? MethodAuth.SingUp : MethodAuth.SingIn,
                      );
                    },
                    child: Text(
                      _isSingIn ? 'Fazer Cadastro ?' : 'Fazer Login ?',
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
