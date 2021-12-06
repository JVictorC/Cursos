import 'package:auth_firebase/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'Bem Vindo',
              style: GoogleFonts.montserrat(),
            ),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Sair',
              style: GoogleFonts.montserrat(),
            ),
            onTap: () => auth.logout(),
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
