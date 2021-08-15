import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class convidadosPage extends StatefulWidget {
  @override
  _convidadosPageState createState() => _convidadosPageState();
}

class _convidadosPageState extends State<convidadosPage> {
  List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await rootBundle.loadString('assets/teste.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    data = csvTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () async {
            await loadAsset();
            print(data);
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
}
