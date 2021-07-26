import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meu_evento/app/data/events.dart';
import 'package:meu_evento/app/models/Evento.dart';

class Events with ChangeNotifier {
  final Map<String, Evento> _items = {...EVENTS};

  List<Evento> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Evento byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Evento evento) {
    if (evento == null) {
      return;
    }

    if (evento.id != null &&
        evento.id.trim().isNotEmpty &&
        _items.containsKey(evento.id)) {
      _items.update(
        evento.id,
        (_) => Evento(
          id: evento.id,
          nome: evento.nome,
          conjuge1: evento.conjuge1,
          conjuge2: evento.conjuge2,
          convidados: evento.convidados,
          data: evento.data,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Evento(
          id: evento.id,
          nome: evento.nome,
          conjuge1: evento.conjuge1,
          conjuge2: evento.conjuge2,
          convidados: evento.convidados,
          data: evento.data,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Evento evento) {
    if (evento != null && evento.id != null) {
      _items.remove(evento.id);
      notifyListeners();
    }
  }
}
