import 'package:auth_firebase/models/coin.dart';
import 'package:auth_firebase/providers/conversor_coin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalConversaoMoeda extends StatefulWidget {
  final List<Coin> arrayCoins;

  const ModalConversaoMoeda({
    Key? key,
    required this.arrayCoins,
  }) : super(key: key);

  @override
  _ModalConversaoMoedaState createState() => _ModalConversaoMoedaState();
}

class _ModalConversaoMoedaState extends State<ModalConversaoMoeda> {
  String _selectedTextConvert = 'USD';

  void loadedData(BuildContext context) {
    final conversorCoin = Provider.of<ConversorCoin>(context);
    _selectedTextConvert = conversorCoin.coinForConverson;
  }

  @override
  Widget build(BuildContext context) {
    loadedData(context);
    final conversorCoin = Provider.of<ConversorCoin>(context);
    final _avaliableScreen = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: _avaliableScreen * .7,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Converte de:',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: widget.arrayCoins.length,
                    itemBuilder: (ctx, index) {
                      final coin = widget.arrayCoins[index];
                      final bool isCheek = _selectedTextConvert == coin.code;
                      return Column(
                        children: [
                          ListTile(
                            tileColor: isCheek
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.8)
                                : null,
                            subtitle: Text(
                              coin.code,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                color: isCheek ? Colors.white : null,
                              ),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                coin.getName(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: isCheek ? Colors.white : null,
                                ),
                              ),
                            ),
                            trailing: _selectedTextConvert == coin.code
                                ? Icon(
                                    Icons.done,
                                    size: 25,
                                    color: isCheek ? Colors.white : null,
                                  )
                                : null,
                            onTap: () {
                              setState(() => _selectedTextConvert = coin.code);
                              conversorCoin.setCoinToConvert(coin.code);
                            },
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
