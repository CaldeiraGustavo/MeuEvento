import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meu_evento/app/models/Convidado.dart';

class ConvidadoFirestore {
  late CollectionReference convidados;
  ConvidadoFirestore(docId) {
    convidados = FirebaseFirestore.instance
        .collection('Evento')
        .doc(docId)
        .collection('Convidados');
  }

  Future<void> store(Convidado conv) {
    // Call the user's CollectionReference to add a new user
    return convidados
        .add({
          'nome': conv.nome,
          'isPadrinho': conv.isPadrinho,
        })
        .then((value) => print("Adicionado"))
        .catchError((error) => print("Erro: $error"));
  }

  Future<void> delete(id) {
    return convidados
        .doc(id)
        .delete()
        .then((value) => print("deletado"))
        .catchError((error) => print("Erro: $error"));
  }

  Future<void> deleteAllDocs() async {
    WriteBatch writeBatch = FirebaseFirestore.instance.batch();

    await writeBatch.commit();
  }

  Future<void> storeAllGuests(List<Convidado> data) async {
    WriteBatch writeBatch = FirebaseFirestore.instance.batch();
    String flag = '';
    int timestamp;

    var snapshots = await convidados.get();
    //apaga os antigos convidados
    for (var doc in snapshots.docs) {
      writeBatch.delete(doc.reference);
    }

    //salva os novos
    data.forEach((row) => {
          timestamp = DateTime.now().microsecondsSinceEpoch,
          writeBatch.set(convidados.doc('$timestamp'), row.toJSON())
        });

    writeBatch.commit();
  }
}
