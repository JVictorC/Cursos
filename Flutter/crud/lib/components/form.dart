import 'package:crud/models/user.dart';
import 'package:crud/providers/Users/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormUser extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, String> formDate;
  final void Function(BuildContext context) handleSubmitForm;

  const FormUser({
    Key? key,
    required this.formKey,
    required this.formDate,
    required this.handleSubmitForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avaliableScreenHeight = MediaQuery.of(context).size.height;
    final userProvider = Provider.of<Users>(context);
    final User? editUser = userProvider.getEditUser;

    return Form(
      key: formKey,
      child: Container(
        height: avaliableScreenHeight * (avaliableScreenHeight < 400 ? .7 : .4),
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                label: Text('Nome'),
              ),
              initialValue: editUser == null ? '' : editUser.name,
              validator: (_nome) {
                final nome = _nome ?? '';
                if (nome.trim().isEmpty) {
                  return 'O campo Nome não pode ser vazio';
                } else if (nome.trim().length <= 3) {
                  return 'O campo Nome deve ter ao Menos 3 caracteres';
                }
              },
              onSaved: (_nome) {
                final nome = _nome ?? '';
                formDate['nome'] = nome;
              },
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                label: Text('E-mail'),
              ),
              initialValue: editUser == null ? '' : editUser.email,
              validator: (_email) {
                final email = _email ?? '';
                if (email.trim().isEmpty) {
                  return 'O campo Email não pode ser vazio';
                } else if (!email.trim().contains('@')) {
                  return 'O campo email deve ser um email valido';
                }
              },
              onSaved: (_email) {
                final email = _email ?? '';
                formDate['email'] = email;
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.link),
                label: Text('Link Avatar'),
              ),
              initialValue: editUser == null ? '' : editUser.avatarUrl,
              onSaved: (_avatarUrl) {
                final avatarUrl = _avatarUrl ?? '';
                formDate['avatarUrl'] = avatarUrl;
              },
              onFieldSubmitted: (_) => handleSubmitForm(context),
            ),
          ],
        ),
      ),
    );
  }
}
