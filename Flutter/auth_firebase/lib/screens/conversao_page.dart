import 'package:auth_firebase/components/app_bar_widget.dart';
import 'package:auth_firebase/components/app_drawer.dart';
import 'package:auth_firebase/components/modal_conversao_moeda.dart';
import 'package:auth_firebase/providers/coins.dart';
import 'package:auth_firebase/providers/conversor_coin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConversaoPage extends StatefulWidget {
  const ConversaoPage({Key? key}) : super(key: key);

  @override
  State<ConversaoPage> createState() => _ConversaoPageState();
}

class _ConversaoPageState extends State<ConversaoPage> {
  final TextEditingController _fieldCoinConvert = TextEditingController();
  final TextEditingController _fieldConvert = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fieldCoinConvert.text = '0.00';
    _fieldConvert.text = '0.00';
  }

  @override
  Widget build(BuildContext context) {
    final conversor = Provider.of<ConversorCoin>(context);
    final coins = Provider.of<Coins>(context);
    final _avaliableScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Conversão de Moedas',
          style: GoogleFonts.montserrat(),
        ),
        widgets: [
          IconButton(
            onPressed: () {
              setState(() {
                _fieldCoinConvert.text = '0.00';
                _fieldConvert.text = '0.00';
              });
            },
            icon: const Icon(Icons.replay),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: _avaliableScreenHeight * .8 -
              MediaQuery.of(context).viewInsets.bottom,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(
                  Icons.monetization_on,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                            conversor.coinForConverson,
                            style: GoogleFonts.montserrat(fontSize: 18),
                          ),
                          icon: const Icon(
                            Icons.monetization_on,
                            size: 30,
                          ),
                        ),
                        style: GoogleFonts.montserrat(fontSize: 23),
                        textInputAction: TextInputAction.next,
                        controller: _fieldCoinConvert,
                        keyboardType: TextInputType.number,
                        onTap: () =>
                            setState(() => _fieldCoinConvert.text = ''),
                        onChanged: (value) {
                          final data =
                              coins.getDataOfThe(conversor.coinForConverson);
                          try {
                            _fieldConvert.text =
                                (data * double.parse(value)).toStringAsFixed(2);
                          } catch (e) {
                            _fieldConvert.text = data.toStringAsFixed(2);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                            'BRL',
                            style: GoogleFonts.montserrat(fontSize: 18),
                          ),
                          icon: const Icon(
                            Icons.monetization_on,
                            size: 30,
                          ),
                        ),
                        style: GoogleFonts.montserrat(fontSize: 23),
                        keyboardType: TextInputType.number,
                        controller: _fieldConvert,
                        onTap: () => setState(() => _fieldConvert.text = ''),
                        onChanged: (value) {
                          final data =
                              coins.getDataOfThe(conversor.coinForConverson);
                          try {
                            _fieldCoinConvert.text =
                                (double.parse(value) / data).toStringAsFixed(2);
                          } catch (e) {
                            _fieldCoinConvert.text = data.toStringAsFixed(2);
                          }
                        },
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.monetization_on_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            coins
                                .getDataOfThe(conversor.coinForConverson)
                                .toStringAsFixed(2),
                            style: GoogleFonts.montserrat(fontSize: 30),
                          )
                        ],
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            _fieldCoinConvert.text = '0.00';
            _fieldConvert.text = '0.00';
          });
          final coins = Provider.of<Coins>(context, listen: false).arrayCoins;
          showModalBottomSheet(
            context: context,
            builder: (_) => ChangeNotifierProvider.value(
              value: conversor,
              child: ModalConversaoMoeda(
                arrayCoins: coins,
              ),
            ),
          );
        },
        child: Text(
          'Selecionar Moedas',
          style: GoogleFonts.montserrat(fontSize: 15),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
