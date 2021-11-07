import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Text(
              'Bem Vindo a Versão PlayGround do Mercado Livre',
              style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w300, letterSpacing: 2),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Image.asset(
          'assets/images/welcome.png',
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
