import 'package:auth_firebase/exceptions/auth_exeptions.dart';
import 'package:auth_firebase/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormLogin extends StatefulWidget {
  final bool isSingIn;
  final bool isSignUp;

  const FormLogin({
    Key? key,
    required this.isSignUp,
    required this.isSingIn,
  }) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final Map<String, String> _formData = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool _showPassWord = true;

  final TextEditingController _password = TextEditingController();

  String? emailValidation(String? _email) {
    final email = _email ?? '';
    if (email.trim().isEmpty) return 'O campo de e-mail não pode ser vazio';
    if (!email.trim().contains('@')) {
      return 'O e-mail precisa ser um e-mail valido';
    }
  }

  String? passwordValidation(String? _passWord) {
    final passWoord = _passWord ?? '';

    if (passWoord.isEmpty) return 'O campo de senha não pode ser vazio';
    if (passWoord.length < 6) {
      return 'A senha precisa ter pelo menos 6 caracteres';
    }
  }

  void _showDialogError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.vertical,
        duration: const Duration(seconds: 2),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              msg,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Icon(
              Icons.error,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    final _isValid = _formKey.currentState!.validate();
    _formKey.currentState!.save();
    if (!_isValid) return;
    final auth = Provider.of<Auth>(context, listen: false);

    setState(() => _isLoading = true);

    try {
      if (widget.isSingIn) {
        await auth.singIn(_formData);
      } else {
        await auth.singUp(_formData);
      }
    } on AuthException catch (e) {
      _showDialogError(e.toString());
    } catch (e) {
      _showDialogError('Ocorreu um erro inexperado');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              label: Text('E-mail'),
            ),
            validator: emailValidation,
            onSaved: (value) => _formData['email'] = value!,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.password),
              label: const Text('Senha'),
              suffixIcon: IconButton(
                onPressed: () => setState(
                  () => _showPassWord = !_showPassWord,
                ),
                icon: Icon(
                  _showPassWord ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            obscureText: _showPassWord,
            validator: passwordValidation,
            onSaved: (password) => _formData['password'] = password!,
            controller: _password,
            onChanged: (_) => setState(() {}),
          ),
          if (widget.isSignUp)
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.password),
                label: Text(
                  widget.isSignUp ? 'Confirmar Senha' : 'Senha',
                ),
                suffixIcon: IconButton(
                  enableFeedback: true,
                  onPressed: () => setState(
                    () => _showPassWord = !_showPassWord,
                  ),
                  icon: Icon(
                    _showPassWord ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              obscureText: _showPassWord,
              validator: (_passwordConfirmation) {
                final confimationPassword = _passwordConfirmation ?? '';
                if (_password.text != confimationPassword) {
                  return 'As senha não conferem';
                }
              },
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 15,
              ),
            ),
            onPressed: _submitForm,
            child: _isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
                : Text(widget.isSingIn ? 'Fazer Login' : 'Fazer Cadastro'),
          ),
        ],
      ),
    );
  }
}
