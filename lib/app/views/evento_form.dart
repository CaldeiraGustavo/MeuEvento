import 'package:flutter/material.dart';
import 'package:meu_evento/app/models/Evento.dart';
import 'package:provider/provider.dart';

class EventoForm extends StatefulWidget {
  @override
  _EventoFormState createState() => _EventoFormState();
}

class _EventoFormState extends State<EventoForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Evento evento) {
    if (evento != null) {
      _formData['id'] = evento.id;
      _formData['nome'] = evento.nome;
      _formData['conjuge1'] = evento.conjuge1;
      _formData['conjuge2'] = evento.conjuge2;
      _formData['convidados'] = evento.convidados.toString();
      _formData['Data'] = evento.data.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário de Evento'), actions: <Widget>[
        IconButton(icon: Icon(Icons.save), onPressed: () {}),
      ]),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Cônjuge 1"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Cônjuge 2"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Data"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Convidados"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
