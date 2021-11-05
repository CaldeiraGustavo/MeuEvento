import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meu_evento/app/db/ContratoFirebase.dart';
import 'package:meu_evento/app/models/Firebase_file.dart';
import 'package:meu_evento/app/views/upload_page.dart';

class ContratosPage extends StatefulWidget {
  final String noteId;
  const ContratosPage({Key? key, required this.noteId}) : super(key: key);
  @override
  _ContratosPageState createState() => _ContratosPageState();
}

class _ContratosPageState extends State<ContratosPage> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();
  }

  UploadTask? task;
  File? file;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Lista de contratos"),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.upload),
            onPressed: () async {
              await Navigator.of(context)
                  .push(MaterialPageRoute(
                    builder: (context) => UploadPage(noteId: widget.noteId),
                  ))
                  .then((value) => setState(() {}));
            }),
        body: FutureBuilder<List<FirebaseFile>>(
          future: FirebaseApi.listAll(widget.noteId + '/files/'),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  final files = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(files.length),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (context, index) {
                            final file = files[index];

                            return buildFile(context, file);
                          },
                        ),
                      ),
                    ],
                  );
                }
            }
          },
        ),
      );

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        title: Text(
          file.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
        onTap: () async {
          await FirebaseApi.downloadFileExample(file.ref);

          final snackBar = SnackBar(
            content: Text('Arquivo baixado: ${file.name}'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        // onTap: () => Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => ImagePage(file: file),
        // )),
      );

  Widget buildHeader(int length) => ListTile(
        tileColor: Colors.blue,
        leading: Container(
          width: 52,
          height: 52,
          child: Icon(
            Icons.file_copy,
            color: Colors.white,
          ),
        ),
        title: Text(
          '$length Arquivo(s)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
}
