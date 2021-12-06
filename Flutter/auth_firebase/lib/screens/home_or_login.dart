import 'package:auth_firebase/providers/auth.dart';
import 'package:auth_firebase/screens/home_page.dart';
import 'package:auth_firebase/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return FutureBuilder(
      future: auth.trySingIn(),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          const Center(child: CircularProgressIndicator());
        } else if (snapShot.error != null) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: const Text(
                      'Aconteceu um erro inexperado ao tentar carregar a aplicação',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Icon(
                    Icons.engineering_rounded,
                    size: 45,
                  )
                ],
              ),
            ),
          );
        }
        return auth.isAuth ? const HomePage() : const LoginPage();
      },
    );
  }
}
