import 'package:crud/components/user_data.dart';
import 'package:crud/models/user.dart';
import 'package:crud/providers/Users/users.dart';
import 'package:crud/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                users.setEditUser(null);
                Navigator.of(context).pushNamed(AppRoutes.FORM);
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Nova Tarefa'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
              ),
            )
          ],
        ),
        body: Observer(
          builder: (ctx) => ListView.builder(
            itemCount: users.totalUsers,
            itemBuilder: (ctx, index) {
              final User user = users.getUsers.values.elementAt(index);
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: UserData(user: user),
                  ),
                  const Divider(thickness: 1),
                ],
              );
            },
          ),
        ));
  }
}
