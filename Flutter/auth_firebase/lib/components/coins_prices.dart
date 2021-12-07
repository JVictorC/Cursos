import 'package:auth_firebase/providers/coins.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoinsPrices extends StatelessWidget {
  const CoinsPrices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coins = Provider.of<Coins>(context);

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: FutureBuilder(
        future: coins.loadedCoins(),
        builder: (ctx, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapShot.error != null) {
            return const Center(child: Text('Ocorreu um Erro Ao Carregar os Dados'));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coins.arrayCoins.length,
            itemBuilder: (ctx, index) {
              final coin = coins.arrayCoins[index];
              return Card(
                elevation: 5,
                child: SizedBox(
                  width: 250,
                  child: ListTile(
                    title: Text(
                      coin.code,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'R\$ ${coin.ask.toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                    ),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.green[600],
                        ),
                        Text(
                          'R\$ ${coin.high.toStringAsFixed(2)}',
                          style:
                              GoogleFonts.montserrat(color: Colors.green[600]),
                        )
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                        ),
                        Text(
                          'R\$ ${coin.low.toStringAsFixed(2)}',
                          style: GoogleFonts.montserrat(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
