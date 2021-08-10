import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meu_evento/app/models/Orcamento.dart';
import 'package:meu_evento/app/models/Evento.dart';

class OrcamentoFirestore {
  final CollectionReference orcamento = FirebaseFirestore.instance.collection('orcamento');

  Future<void> store(Orcamento orc) {
    // Call the user's CollectionReference to add a new user
    return orcamento
        .add({
          'descricao': orc.descricao,
          'valor': orc.valor,
          'tipo': orc.tipo,
    })
        .then((value) => print("Adicionado"))
        .catchError((error) => print("Erro: $error"));
  }

  Future<void> delete(id) {
    return orcamento
        .doc(id)
        .delete()
        .then((value) => print("deletado"))
        .catchError((error) => print("Erro: $error"));
  }

  Future<void> getData() async {
    /*
    // Get docs from collection reference
    List<Orcamento> orcamentos;
    // final allData = orcamento.withConverter<Orcamento>(
    //     fromFirestore: (snapshots, _) => Orcamento.fromJson(snapshots.data()!),
    //     toFirestore: (orc, _) => orc.toJson());
    // List<QueryDocumentSnapshot<Orcamento>> orcamentum = await allData
    //     .get()
    //     .then((snapshot) => snapshot.docs);
    // final teste = await allData.get();
    // print(teste);
    QuerySnapshot querySnapshot = await orcamento.get();
    // orcamentos = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<Orcamento> r = querySnapshot.docs.map((doc) => doc.data()).toList().map((data) => Orcamento.fromJson(data));
    return r;
    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data());
    // List<Orcamento> listData;
    // Orcamento teste;
    // allData.toList().map((data) => {
    //   teste = new Orcamento(id: data['id'], descricao: descricao, valor: valor, tipo: tipo)
    // });

//    final allData = querySnapshot.docs.map((doc) => Orcamento.fromJson(doc.data())).toList();

    // return allData;

     */
  }
}
