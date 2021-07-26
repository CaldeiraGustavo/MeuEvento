import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meu_evento/app/data/events.dart';
import 'package:meu_evento/app/models/Evento.dart';

class Cronograma {
    final CollectionReference cronograma = FirebaseFirestore.instance.collection('cronograma');

    Future<void> store() {
      // Call the user's CollectionReference to add a new user
      return cronograma
          .add({
        'ordem': "1",
        'nome': "Florista"
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
}
