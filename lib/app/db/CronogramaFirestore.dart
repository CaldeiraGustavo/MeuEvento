import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meu_evento/app/models/Cronograma.dart';

class CronogramaFirestore {
  late CollectionReference cronograma;

  CronogramaFirestore(docId) {
    cronograma = FirebaseFirestore.instance
        .collection('Evento')
        .doc(docId)
        .collection('Cronograma');
  }
  Future<void> store(Cronograma c) {
      return cronograma
          .add({
        'title': c.descricao,
        'ok': c.status
      })
          .then((value) => print(c.descricao))
          .catchError((error) => print("Failed to add Cronograma: $error"));
    }

  Future<void> delete(id) {
    return cronograma
        .doc(id)
        .delete()
        .then((value) => print("deletado"))
        .catchError((error) => print("Erro: $error"));
  }
}
