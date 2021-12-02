import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_udemy/exeptions/auth_exeption.dart';
import 'package:shop_udemy/models/auth.dart';

// ignore: constant_identifier_names
enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  AuthMode _authMode = AuthMode.Login;
  final Map<String, String> _authDate = {'email': '', 'password': ''};

  bool _isLoading = false;

  bool _showPassword = true;

  final passWordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLogin() => _authMode == AuthMode.Login;

  bool _isSignup() => _authMode == AuthMode.Signup;

  void _swithAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.Signup;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text(
            'Ocorreu um Erro',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text(msg))
    // );
  }

  Future<void> _submit() async {
    final _isValid = _formKey.currentState!.validate();
    if (!_isValid) {
      return;
    }
    setState(() => _isLoading = true);
    Auth auth = Provider.of<Auth>(context, listen: false);

    _formKey.currentState!.save();

    try {
      if (_isLogin()) {
        await auth.login(
          _authDate['email']!,
          _authDate['password']!,
        );
      } else {
        await auth.signup(
          _authDate['email']!,
          _authDate['password']!,
        );
      }
    } on AuthException catch (e) {
      _showErrorDialog(e.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu um Erro inesperado');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: _isLogin() ? 320 : 400,
        width: deviceSize.width * .9,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authDate['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.trim().isEmpty || !email.contains('@')) {
                    return 'Informe um e-mail valido';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _showPassword = !_showPassword);
                    },
                    icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: _showPassword,
                controller: passWordController,
                onSaved: (password) => _authDate['password'] = password ?? '',
                validator: _isLogin()
                    ? null
                    : (_password) {
                        final password = _password ?? '';
                        if (password.isEmpty || password.length < 5) {
                          return 'Informe uma senha valida';
                        }
                      },
              ),
              if (_isSignup())
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => _showPassword = !_showPassword);
                      },
                      icon:  Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: _showPassword,
                  validator: (_confirmPassword) {
                    final confirmPassword = _confirmPassword ?? '';
                    if (passWordController.text != confirmPassword) {
                      return 'Senhas Informadas Não Conferem.';
                    }
                  },
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submit(),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        _authMode == AuthMode.Login ? 'ENTRAR' : 'REGISTRAR',
                      ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => _swithAuthMode(),
                child: Text(
                  _isLogin() ? 'DESEJA REGISTRAR?' : 'JÁ POSSUI CONTA?',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
