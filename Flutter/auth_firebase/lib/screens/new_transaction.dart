import 'package:auth_firebase/components/alert_choice_coin.dart';
import 'package:auth_firebase/providers/coins.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewTransAction extends StatefulWidget {
  const NewTransAction({Key? key}) : super(key: key);

  @override
  State<NewTransAction> createState() => _NewTransActionState();
}

class _NewTransActionState extends State<NewTransAction> {
  DateTime _dateTransAction = DateTime.now();
  final Map<String, Object> _formData = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> _coinSeleted = {
    "code": 'USD',
    "name": 'Dólar Americano'
  };

  void _showDataPocker(BuildContext context) async {
    final dataChoice = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    if (dataChoice == null) return;

    setState(() {
      _dateTransAction = dataChoice;
    });
  }

  void _showCoinsCode(BuildContext context) async {
    final coin = await showDialog(
      context: context,
      builder: (ctx) {
        return AlertChoiceCoin(coinSeleted: _coinSeleted);
      },
    );

    setState(() => _coinSeleted = coin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova TransAction'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Titulo'), icon: Icon(Icons.title)),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Descrição'),
                      icon: Icon(Icons.description),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Valor Gasto'),
                      icon: Icon(Icons.monetization_on),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 200,
                          child: ElevatedButton.icon(
                            onPressed: () => _showDataPocker(context),
                            icon: const Icon(Icons.date_range),
                            label: const Text(
                              'Selecionar Data',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 100,
                          child: Text(
                            DateFormat('dd/MMM/yyyy').format(
                              _dateTransAction,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 200,
                        child: ElevatedButton.icon(
                          onPressed: () => _showCoinsCode(context),
                          icon: const Icon(Icons.monetization_on),
                          label: const Text(
                            'Selecionar Moeda',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 100,
                        child: Text(
                          _coinSeleted['name']!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Total R\$: 0',
                        style: GoogleFonts.montserrat(fontSize: 25),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
