import 'package:auth_firebase/components/pop_menu_body_home.dart';
import 'package:auth_firebase/components/transaction.dart';
import 'package:auth_firebase/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'Transações Recentes',
            style: GoogleFonts.montserrat(
                fontSize: 25, color: Theme.of(context).colorScheme.primary),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummy_data.length,
              itemBuilder: (ctx, index) {
                final transAction = dummy_data[index];
                return TransActionWidget(transAction: transAction);
              },
            ),
          ),
        ],
      ),
    );
  }
}
