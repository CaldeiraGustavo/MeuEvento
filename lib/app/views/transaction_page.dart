import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_evento/app/db/OrcamentoFirestore.dart';
import 'package:meu_evento/app/models/Orcamento.dart';
import 'package:meu_evento/app/widget/new_transaction.dart';

class OrcamentoList extends StatefulWidget {
  final String noteId;
  const OrcamentoList({Key? key, required this.noteId}) : super(key: key);

  @override
  _OrcamentoListState createState() => _OrcamentoListState();
}

class _OrcamentoListState extends State<OrcamentoList> {
  final List<Orcamento> orcamentos = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [addButton(context)],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Evento')
            .doc(widget.noteId)
            .collection('Orcamento')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return new ListView(
                children:
                    (snapshot.data!).docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: data['tipo'] == "Recebido"
                              ? Colors.green.shade600
                              : Colors.red,
                          radius: 30,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text(
                                  '${NumberFormat.currency(symbol: 'R\$ ').format(data['valor'])}'),
                            ),
                          )),
                      title: Text(
                        data['descricao'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        data['tipo'],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => deleteTx(document.reference.id),
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }

  Widget addButton(BuildContext ctx) => IconButton(
      icon: Icon(Icons.add),
      onPressed: () async {
        showModalBottomSheet(
            context: ctx,
            builder: (_) {
              return NewTransaction(noteId: widget.noteId);
            });
      });

  void deleteTx(id) async {
    OrcamentoFirestore orc = new OrcamentoFirestore(widget.noteId);
    orc.delete(id);
  }
}
