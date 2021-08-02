import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_evento/app/db/OrcamentoFirestore.dart';
import 'package:meu_evento/app/models/Orcamento.dart';

class OrcamentoList extends StatefulWidget {
  const OrcamentoList({Key? key}) : super(key: key);

  @override
  _OrcamentoListState createState() => _OrcamentoListState();
}

class _OrcamentoListState extends State<OrcamentoList> {
  final List<Orcamento> orcamentos = [];
  final Function deleteTx = () => {};
  @override
  void initState() {
    super.initState();
    OrcamentoFirestore or = new OrcamentoFirestore();
    or.getData().then((value) => {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('orcamento').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center (child: CircularProgressIndicator());
            default:
              return new ListView(
                children: (snapshot.data!).docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text('\$${data['valor']}'),
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
                        onPressed: () => deleteTx(data['id']),
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
}
