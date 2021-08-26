import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meu_evento/app/db/ConvidadoFirestore.dart';
import 'package:meu_evento/app/models/Convidado.dart';

class ConvidadosPage extends StatefulWidget {
  final String noteId;
  const ConvidadosPage({Key? key, required this.noteId}) : super(key: key);

  @override
  _ConvidadosPageState createState() => _ConvidadosPageState();
}

class _ConvidadosPageState extends State<ConvidadosPage> {
  UploadTask? task;
  File? file;

  loadAsset() async {
    List<Convidado> data = [];
    try {
      await selectFile();
      String dados = file!.readAsStringSync(encoding: utf8);
      List<List<dynamic>> csvTable =
          CsvToListConverter(fieldDelimiter: ';').convert(dados);

      if (csvTable.isNotEmpty) {
        csvTable.forEach((item) => {
              if (item[0].toString() != "Nome do Convidado")
                {
                  data.add(new Convidado(
                      nome: item[0].toString(),
                      isPadrinho: item[1].toString().toUpperCase() == "SIM",
                      importado: true))
                }
            });
        await ConvidadoFirestore(widget.noteId).storeAllGuests(data);
      } else {
        print("Arquivo vazio");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () async {
              await loadAsset();
            }),
        appBar: AppBar(
          title: Text("Lista de Convidados"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Evento')
                .doc(widget.noteId)
                .collection('Convidados')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Nome')),
                              DataColumn(label: Text('Padrinho')),
                            ],
                            rows: (snapshot.data!)
                                .docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                              return DataRow(cells: [
                                DataCell(
                                  Text(data['nome']),
                                ),
                                DataCell(
                                  Text(data['isPadrinho'] == true
                                      ? 'Padrinho'
                                      : 'Convidado'),
                                ),
                              ]);
                            }).toList(),
                          )));
              }
            }));
  }

  void refresh(List data) => setState(() => {});

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['csv']);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }
}
