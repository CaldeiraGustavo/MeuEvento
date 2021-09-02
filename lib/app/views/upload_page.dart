import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meu_evento/app/db/ContratoFirebase.dart';
import 'package:meu_evento/app/widget/button_widget.dart';
import 'package:path/path.dart';

class UploadPage extends StatefulWidget {
  final String noteId;
  const UploadPage({Key? key, required this.noteId}) : super(key: key);
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? basename(file!.path) : 'Nenhum arquivo selecionado.';
    return Scaffold(
      appBar: AppBar(
        title: Text("Anexar Contratos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Selecionar arquivo',
                icon: Icons.attach_file,
                onClicked: selectFile,
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
              ButtonWidget(
                text: 'Carregar arquivo',
                icon: Icons.cloud_upload_outlined,
                onClicked: uploadFile,
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = widget.noteId + '/files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {
      Navigator.pop(this.context);
    });
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
