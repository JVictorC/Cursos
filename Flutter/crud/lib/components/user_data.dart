import 'package:crud/models/user.dart';
import 'package:crud/providers/Users/users.dart';
import 'package:crud/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData extends StatelessWidget {
  final User user;

  const UserData({Key? key, required this.user}) : super(key: key);

  void handleEdituser(BuildContext context) {
    final userProvider = Provider.of<Users>(context, listen: false);
    userProvider.setEditUser(user);
    Navigator.of(context).pushNamed(AppRoutes.FORM);
  }

  Future<bool> confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: const Text('Deseja Continuar ?'),
                content: const Text(
                    'Caso marque Sim o usúario será excluido da sua lista!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                    child: const Text('Sim'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Não'),
                  ),
                ],
              );
            }) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final icon = user.avatarUrl == ''
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(user.avatarUrl),
          );

    final userProvider = Provider.of<Users>(context);

    return Dismissible(
      key: Key(user.name),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(25),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (_) => confirmDelete(context),
      onDismissed: (_) {
        userProvider.removerUser(user);
      },
      child: ListTile(
        leading: icon,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () => handleEdituser(context),
                icon: const Icon(Icons.edit),
                color: Colors.orange,
              ),
              IconButton(
                onPressed: () async {
                  final bool verification = await confirmDelete(context);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (verification) {
                    userProvider.removerUser(user);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('O Item foi Excluido'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('O Item não foi Excluido'),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
