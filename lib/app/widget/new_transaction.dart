import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_evento/app/db/OrcamentoFirestore.dart';
import 'package:meu_evento/app/models/Orcamento.dart';

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

    if (enteredTitle.length == 0 ||
        enteredAmount < 0) {
      return;
    }
    OrcamentoFirestore fire = new OrcamentoFirestore(widget.noteId);
    Orcamento orc = new Orcamento(
        descricao: enteredTitle,
        valor: enteredAmount,
        tipo: dropdownValue
    );
    fire.store(orc);

    Navigator.of(context).pop();
  }
  String dropdownValue = 'Recebido';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Descrição'),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Preço'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Gasto', 'Recebido']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextButton(
                child: Text('Adicionar'),
                onPressed: () => submitData())
          ],
        ),
      ),
    );
  }
}