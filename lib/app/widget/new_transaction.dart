import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_evento/app/db/OrcamentoFirestore.dart';
import 'package:meu_evento/app/models/Orcamento.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction();

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
    OrcamentoFirestore fire = new OrcamentoFirestore();
    Orcamento orc = new Orcamento(
        id: 4,
        descricao: enteredTitle,
        valor: enteredAmount,
        tipo: "GASTO"
    );
    fire.store(orc);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            TextButton(
                child: Text('Add Transaction'),
                onPressed: () => submitData())
          ],
        ),
      ),
    );
  }
}