import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meu_evento/app/models/Evento.dart';

class EventoFirestore {
  final CollectionReference evento = FirebaseFirestore.instance.collection('Evento');

  Future<void> store(Event ev) {
    return evento.add({
      'nome': ev.nome,
      'conjuge1': ev.conjuge1,
      'conjuge2': ev.conjuge2,
      'endereco': ev.endereco,
      'convidados': ev.convidados,
      'data': ev.data,
    })
        .then((value) => print("Adicionado"))
        .catchError((error) => print("Erro: $error"));
  }

  Future<void> delete(id) {
    return evento
        .doc(id)
        .delete()
        .then((value) => print("Deletado"))
        .catchError((error) => print("Erro: $error"));
  }

  Future<void> update(Event ev, noteId) {
    return evento
        .doc(noteId)
        .update({
          'nome': ev.nome,
          'conjuge1': ev.conjuge1,
          'conjuge2': ev.conjuge2,
      'endereco': ev.endereco,
          'convidados': ev.convidados,
          'data': ev.data,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
