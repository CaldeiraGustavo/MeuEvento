import 'package:cloud_firestore/cloud_firestore.dart';

class Cronograma {
    final CollectionReference cronograma = FirebaseFirestore.instance.collection('cronograma');

    Future<void> store(Cronograma c) {
      return cronograma
          .add({
        'ordem': "1",
        'nome': "Florista"
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
}
