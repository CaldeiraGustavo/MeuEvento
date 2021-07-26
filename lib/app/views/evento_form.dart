import 'package:flutter/material.dart';
import 'package:meu_evento/app/models/Evento.dart';
import 'package:meu_evento/app/db/Events.dart';
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
  void changeDependencies() {
    super.didChangeDependencies();
    final Evento evento =
    ModalRoute.of(context)!.settings.arguments.toString() as Evento;
    _loadFormData(evento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário de Evento'), actions: <Widget>[
        IconButton(icon: Icon(Icons.save), onPressed: () {
          final isValid = _form.currentState!.validate();

          if (isValid) {
            _form.currentState!.save();

            Provider.of<Events>(context, listen: false).put(
              Evento(
                id: _formData['id'].toString(),
                nome: _formData['nome'].toString(),
                conjuge1: _formData['conjuge1'].toString(),
                conjuge2: _formData['conjuge2'].toString(),
                data: _formData['data'].toString(),
                convidados: _formData['convidados'].toString(),
              ),
            );
            Navigator.of(context).pop();
          }
        }),
      ]),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: "Nome do evento"),
                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value
                      .trim()
                      .length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['nome'] = value!,
              ),
              TextFormField(
                initialValue: _formData['conjuge1'],
                decoration: InputDecoration(labelText: "Cônjuge 1"),

                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value
                      .trim()
                      .length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['conjuge1'] = value!,
              ),
              TextFormField(
                initialValue: _formData['conjuge2'],
                decoration: InputDecoration(labelText: "Cônjuge 2"),

                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value
                      .trim()
                      .length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['conjuge2'] = value!,

              ),
              TextFormField(
                initialValue: _formData['data'],
                decoration: InputDecoration(labelText: "Data"),

                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'Data inválida';
                  }

                  return null;
                },
                onSaved: (value) => _formData['data'] = value!,
              ),
              TextFormField(
                initialValue: _formData['convidados'],
                decoration: InputDecoration(labelText: "Convidados"),

                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'numero inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['convidados'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}