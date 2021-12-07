import 'package:auth_firebase/components/transaction.dart';
import 'package:auth_firebase/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final providerTransActions = Provider.of<TransActionsProvider>(context);
    final itensTransActionss = providerTransActions.getItems;
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
              itemCount: itensTransActionss.length,
              itemBuilder: (ctx, index) {
                final transAction = itensTransActionss[index];
                return TransActionWidget(transAction: transAction);
              },
            ),
          ),
        ],
      ),
    );
  }
}
