import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String Nome;
  final String Conjuge1;
  final String? Conjuge2;
  final int? QtdConvidados;
  final ValueChanged<String> onChangedNome;
  final ValueChanged<int> onChangedConvidados;
  final ValueChanged<String> onChangedConjuge1;
  final ValueChanged<String> onChangedConjuge2;

  const NoteFormWidget({
    Key? key,
    this.Nome = '',
    this.Conjuge1 = '',
    this.Conjuge2 = '',
    this.QtdConvidados = 0,
    required this.onChangedNome,
    required this.onChangedConjuge1,
    required this.onChangedConjuge2,
    required this.onChangedConvidados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 8),
              buildConjuge1(),
              SizedBox(height: 8),
              buildConjuge2(),
              SizedBox(height: 16),
              buildConvidados(),
              SizedBox(height: 8),
              buildDataEvento(),
              SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: "Nome do evento",
          border: InputBorder.none,
          hintText: 'Identificação da cerimônia',
          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'Insira o nome' : null,
        onChanged: onChangedNome,
      );

  Widget buildConjuge1() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: "Conjuge 1",
          border: InputBorder.none,
          hintText: 'Nome do Conjuge 1',
          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'Insira o nome' : null,
        onChanged: onChangedConjuge1,
      );

  Widget buildConjuge2() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: "Conjuge 2",
          border: InputBorder.none,
          hintText: 'Nome do conjuge 2',
          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'Este campo não pode ser nulo'
            : null,
        onChanged: onChangedConjuge2,
      );

  Widget buildConvidados() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: "Convidados",
          border: InputBorder.none,
          hintText: 'Quantidade de convidados',
          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
        ),
      );

  Widget buildDataEvento() => TextFormField(
    keyboardType: TextInputType.datetime,
    maxLines: 1,
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      labelText: "Data",
      border: InputBorder.none,
      hintText: 'Data da cerimônia',
      hintStyle: TextStyle(color: Colors.white, fontSize: 10),
    ),
  );
}

//          Column(
//            children: <Widget>[
//              TextFormField(
//                decoration: InputDecoration(labelText: "Nome do evento"),
//                validator: (value) {
//                  if (value == null || value
//                      .trim()
//                      .isEmpty) {
//                    return 'Nome inválido';
//                  }
//
//                  if (value
//                      .trim()
//                      .length < 3) {
//                    return 'Nome muito pequeno. No mínimo 3 letras.';
//                  }
//
//                  return null;
//                },
//              ),
//              TextFormField(
//                decoration: InputDecoration(labelText: "Cônjuge 1"),
//                validator: (value) {
//                  if (value == null || value
//                      .trim()
//                      .isEmpty) {
//                    return 'Nome inválido';
//                  }
//
//                  if (value
//                      .trim()
//                      .length < 3) {
//                    return 'Nome muito pequeno. No mínimo 3 letras.';
//                  }
//
//                  return null;
//                },
//              ),
//              TextFormField(
//                decoration: InputDecoration(labelText: "Cônjuge 2"),
//
//                validator: (value) {
//                  if (value == null || value
//                      .trim()
//                      .isEmpty) {
//                    return 'Nome inválido';
//                  }
//
//                  if (value
//                      .trim()
//                      .length < 3) {
//                    return 'Nome muito pequeno. No mínimo 3 letras.';
//                  }
//
//                  return null;
//                },
//
//              ),
//              TextFormField(
//                decoration: InputDecoration(labelText: "Data"),
//
//                validator: (value) {
//                  if (value == null || value
//                      .trim()
//                      .isEmpty) {
//                    return 'Data inválida';
//                  }
//
//                  return null;
//                },
//              ),
//              TextFormField(
//                decoration: InputDecoration(labelText: "Convidados"),
//
//                validator: (value) {
//                  if (value == null || value
//                      .trim()
//                      .isEmpty) {
//                    return 'numero inválido';
//                  }
//
//                  return null;
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
