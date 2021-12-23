import 'dart:math';

import 'package:crud/components/form.dart';
import 'package:crud/models/user.dart';
import 'package:crud/providers/Users/users.dart';
import 'package:crud/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final Map<String, String> _formData = {};
  final _formKey = GlobalKey<FormState>();

  void handleSubmitForm(BuildContext context) {
    final userProvider = Provider.of<Users>(context, listen: false);
    final validation = _formKey.currentState?.validate() ?? false;
    if (!validation) return;

    _formKey.currentState?.save();
    final user = User(
      id: userProvider.getEditUser == null? Random().nextInt(100).toString() : userProvider.getEditUser!.id,
      name: _formData['nome'].toString(),
      email: _formData['email'].toString(),
      avatarUrl: _formData['avatarUrl'].toString(),
    );

    
    userProvider.addNewUser(user);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Novo Usuario'),
      ),
      body: SingleChildScrollView(
        child: FormUser(
          formDate: _formData,
          formKey: _formKey,
          handleSubmitForm: handleSubmitForm,
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => handleSubmitForm(context),
        child: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [Icon(Icons.add), Text('Adicionar')],
          ),
        ),
      ),
    );
  }
}
