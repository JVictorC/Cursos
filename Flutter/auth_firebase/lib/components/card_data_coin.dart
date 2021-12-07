import 'package:auth_firebase/models/coin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDataCoin extends StatelessWidget {
  final Coin coin;
  final bool isSeleted;
  const CardDataCoin({
    Key? key,
    required this.coin,
    required this.isSeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: ListTile(
          tileColor: isSeleted
              ? Theme.of(context).colorScheme.primary.withOpacity(.8)
              : null,
          title: Text(
            coin.getName(),
            style:
                GoogleFonts.montserrat(color: isSeleted ? Colors.white : null),
          ),
          subtitle: Text(
            coin.code,
            style: GoogleFonts.montserrat(
              color: isSeleted ? Colors.white : null,
            ),
          ),
          trailing: isSeleted
              ? Icon(
                  Icons.done,
                  color: isSeleted ? Colors.white : null,
                )
              : null,
        ),
      ),
    );
  }
}
