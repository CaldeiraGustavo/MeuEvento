import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meu_evento/app/models/Firebase_file.dart';

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  static Future downloadFile(Reference ref) async {
    final Dio _dio = Dio();

    try {
      String url = await ref.getDownloadURL();
      // path

      await _requestPermissions();
      await _dio.download(url, '/storage/emulated/0/Download/' + ref.name);
      // return await ref.writeToFile(file);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> downloadFileExample(ref) async {
    await _requestPermissions();
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('/storage/emulated/0/download/${ref.name}');
    print('${appDocDir.path}/${ref.name}');
    try {
      await ref.writeToFile(downloadToFile);
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print(e);
    }
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<bool> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.accessMediaLocation,
      Permission.manageExternalStorage,
      Permission.mediaLibrary
    ].request();
    return Permission.storage.status == PermissionStatus.granted;
  }
}
