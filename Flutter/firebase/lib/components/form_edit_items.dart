import 'package:firebase/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormEditItems extends StatelessWidget {
  const FormEditItems({
    Key? key,
  }) : super(key: key);

  void _showDatePicker(BuildContext context, ToDo toDo) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    toDo.changeDate(newDate ?? toDo.date);
  }


  void _submitInfos(BuildContext context, ToDo toDo) {
    Navigator.of(context).pop(toDo);
  }

  @override
  Widget build(BuildContext context) {
    final toDo = Provider.of<ToDo>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 450,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('ToDo'),
                ),
                initialValue: toDo.toDo,
                onFieldSubmitted: (value) {
                  toDo.changeToDo(value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Data Selecionada é ${DateFormat('dd/MM/yyyy').format(toDo.date)}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () => _showDatePicker(context, toDo),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Selecionar Data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _submitInfos(context, toDo);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 20
                  ),
                  child: Text('FinaLizar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
