import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_evento/app/db/OrcamentoFirestore.dart';
import 'package:meu_evento/app/models/Orcamento.dart';

import '../../constants.dart';

class NewTransaction extends StatefulWidget {
  final dynamic noteId;
  NewTransaction({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.length == 0 || enteredAmount < 0) {
      return;
    }
    OrcamentoFirestore fire = new OrcamentoFirestore(widget.noteId);
    Orcamento orc = new Orcamento(
        descricao: enteredTitle, valor: enteredAmount, tipo: dropdownValue);
    fire.store(orc);

    Navigator.of(context).pop();
  }

  String dropdownValue = 'Receita';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        color: kContentColorLightTheme,
        shadowColor: kContentColorLightTheme,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                  ),
                  controller: titleController,
                  style: TextStyle(color: Colors.white),
                  onSubmitted: (_) => submitData,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Preço'),
                  style: TextStyle(color: Colors.white),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Despesa', 'Receita']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: TextStyle(color: Colors.lightGreen)),
                    );
                  }).toList(),
                ),
                TextButton(
                    child: Text('Adicionar',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () => submitData())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
