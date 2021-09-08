import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String Nome;
  final String Conjuge1;
  final String? Conjuge2;
  final int? QtdConvidados;
  final String? DataEvento;
  final String? Endereco;
  final ValueChanged<String> onChangedNome;
  final ValueChanged<String> onChangedConvidados;
  final ValueChanged<String> onChangedConjuge1;
  final ValueChanged<String> onChangedConjuge2;
  final ValueChanged<String> onChangedEndereco;
  final ValueChanged<String> onChangedData;

  const NoteFormWidget({
    Key? key,
    this.Nome = '',
    this.Conjuge1 = '',
    this.Conjuge2 = '',
    this.DataEvento = null,
    this.QtdConvidados,
    this.Endereco = '',
    required this.onChangedNome,
    required this.onChangedConjuge1,
    required this.onChangedConjuge2,
    required this.onChangedConvidados,
    required this.onChangedEndereco,
    required this.onChangedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 10),
              buildConjuge1(),
              SizedBox(height: 10),
              buildConjuge2(),
              SizedBox(height: 10),
              buildEndereco(),
              SizedBox(height: 10),
              buildDataEvento(),
              SizedBox(height: 15),
              Text(
                "Convidados:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              buildConvidados(),
              SizedBox(height: 10),
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
          border: InputBorder.none,
          hintText: 'Identificação da cerimônia',
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        controller: TextEditingController(text: this.Nome),
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
          border: InputBorder.none,
          hintText: 'Conjuge 1',
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        controller: TextEditingController(text: this.Conjuge1),
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
          border: InputBorder.none,
          hintText: 'Conjuge 2',
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        controller: TextEditingController(text: this.Conjuge2),
        validator: (title) => title != null && title.isEmpty
            ? 'Este campo não pode ser nulo'
            : null,
        onChanged: onChangedConjuge2,
      );

  Widget buildConvidados() => TextFormField(
        keyboardType: TextInputType.number,
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Convidados',
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
    controller: TextEditingController(text: this.QtdConvidados.toString()),
        validator: (title) => title != null && title.isEmpty
            ? 'Este campo não pode ser nulo'
            : null,
        onChanged: onChangedConvidados,
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
          border: InputBorder.none,
          hintText: 'Data da cerimônia',
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        controller: TextEditingController(text: this.DataEvento),
        validator: (title) => title != null && title.isEmpty
            ? 'Este campo não pode ser nulo'
            : null,
        onChanged: onChangedData,
      );

  Widget buildEndereco() => TextFormField(
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Endereço do Evento',
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        controller: TextEditingController(text: this.Endereco),
        validator: (title) => title != null && title.isEmpty
            ? 'Este campo não pode ser nulo'
            : null,
        onChanged: onChangedEndereco,
      );
}
