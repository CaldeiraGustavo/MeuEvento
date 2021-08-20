import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class convidadosPage extends StatefulWidget {
  @override
  _convidadosPageState createState() => _convidadosPageState();
}

class _convidadosPageState extends State<convidadosPage> {
  List<List<dynamic>> data = [];
  UploadTask? task;
  File? file;

  loadAsset() async {
    selectFile();
    //final myData = await rootBundle.loadString('assets/teste.csv');
    final dados = file!.readAsStringSync(encoding: utf8);
    List<List<dynamic>> csvTable = CsvToListConverter().convert(dados);
    data = csvTable;
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
      body: SingleChildScrollView(
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(35.0),
            1: FixedColumnWidth(200.0),
          },
          border: TableBorder.all(width: 1.0),
          children: data.map((item) {
            return TableRow(
                children: item.map((row) {
                  return Container(
                    color:
                    row.toString().contains("padrinho") ? Colors.red : Colors
                        .green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        row.toString(),
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  );
                }).toList());
          }).toList(),
        ),
      ),
    );
  }

  void refresh(List data) => setState(() => {});

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }
}
