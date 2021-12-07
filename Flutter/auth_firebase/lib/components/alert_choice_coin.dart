import 'package:auth_firebase/components/card_data_coin.dart';
import 'package:auth_firebase/providers/coins.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlertChoiceCoin extends StatefulWidget {
  final Map<String, String> coinSeleted;

  const AlertChoiceCoin({
    Key? key,
    required this.coinSeleted,
  }) : super(key: key);

  @override
  State<AlertChoiceCoin> createState() => _AlertChoiceCoinState();
}

class _AlertChoiceCoinState extends State<AlertChoiceCoin> {
  Map<String, String> _coinSeleted = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _coinSeleted = widget.coinSeleted;
  }

  @override
  Widget build(BuildContext context) {
    final coins = Provider.of<Coins>(context, listen: false);

    return AlertDialog(
      title: Text(
        'Selecione a Moeda Desejada',
        style: GoogleFonts.montserrat(),
      ),
      content: Column(
        children: [
          const Text('Moedas Disponiveis'),
          Expanded(
            child: SizedBox(
              width: 500,
              child: ListView.builder(
                itemCount: coins.arrayCoins.length,
                itemBuilder: (ctx, index) {
                  final coin = coins.arrayCoins[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _coinSeleted['code'] = coin.code;
                        _coinSeleted['name'] = coin.getName();
                      });
                    },
                    splashColor: Theme.of(context).colorScheme.primary,
                    child: CardDataCoin(
                      coin: coin,
                      isSeleted: coin.code == _coinSeleted['code'],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_coinSeleted);
          },
          child: Text('Ok'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_coinSeleted);
          },
          child: Text('Cancelar'),
        ),
      ],
    );
  }
}
