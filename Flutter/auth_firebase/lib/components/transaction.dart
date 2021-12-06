import 'package:auth_firebase/components/pop_menu_body_home.dart';
import 'package:auth_firebase/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransActionWidget extends StatefulWidget {
  final TransAction transAction;
  const TransActionWidget({Key? key, required this.transAction})
      : super(key: key);

  @override
  _TransActionState createState() => _TransActionState();
}

class _TransActionState extends State<TransActionWidget> {
  bool _showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: Key(widget.transAction.id),
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.transAction.total.toStringAsFixed(2),
                        style: GoogleFonts.montserrat(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(widget.transAction.title),
              subtitle: Text(
                DateFormat('dd/MMM/yyyy').format(widget.transAction.date),
              ),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PopMenuHomePage(),
                    IconButton(
                      onPressed: () => setState(
                        () => _showDescription = !_showDescription,
                      ),
                      icon: Icon(
                        _showDescription
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              child: Text(
                widget.transAction.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(),
              ),
              visible: _showDescription,
            )
          ],
        ),
      ),
    );
  }
}
