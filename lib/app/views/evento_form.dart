import 'package:flutter/material.dart';
import 'package:meu_evento/app/db/EventoFirestore.dart';
import 'package:meu_evento/app/models/Evento.dart';
import 'package:meu_evento/app/widget/NoteFormWidget.dart';

class EventoForm extends StatefulWidget {
  final Event? evento;

  const EventoForm({
    Key? key,
    this.evento,
  }) : super(key: key);

  @override
  _EventoFormState createState() => _EventoFormState();
}

class _EventoFormState extends State<EventoForm> {
  final _form = GlobalKey<FormState>();

  late String nome;
  late String conjuge1;
  late String conjuge2;
  late String endereco;
  late int qtdConvidados;
  late String dataEvento;

  @override
  void initState() {
    super.initState();
    nome = widget.evento?.nome ?? '';
    conjuge1 = widget.evento?.conjuge1 ?? '';
    conjuge2 = widget.evento?.conjuge2 ?? '';
    endereco = widget.evento?.endereco ?? '';
    qtdConvidados = widget.evento?.convidados ?? 0;
    dataEvento = widget.evento?.data ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [buildButton()]),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: NoteFormWidget(
              Nome: nome,
              Conjuge1: conjuge1,
              Conjuge2: conjuge2,
            Endereco: endereco,
            QtdConvidados: qtdConvidados,
              DataEvento: dataEvento,
            onChangedNome: (nome) =>
            {this.nome = nome},
              onChangedConjuge1: (conjuge1) =>
                  {this.conjuge1 = conjuge1},
              onChangedConjuge2: (conjuge2) =>
                  {this.conjuge2 = conjuge2},
            onChangedEndereco: (endereco) =>
            {this.endereco: endereco},
              onChangedConvidados: (qtdconvidados) =>
                  {this.qtdConvidados = int.parse(qtdconvidados)},
              onChangedData: (dataEvento) =>
              {this.dataEvento = dataEvento},),
        ),
      ),
    );
  }

  Widget buildButton() {
    final isFormValid = nome.isEmpty && conjuge1.isNotEmpty &&
        conjuge2.isNotEmpty;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.pinkAccent.shade100,
        ),
        onPressed: addOrUpdateNote,
        //onPressed: () {  },
        child: Text('Salvar'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _form.currentState!.validate();

    if (isValid) {
      await addNote();

      Navigator.of(context).pop();
    }
  }

  Future addNote() async {
    final note = Event(
      nome: nome,
      conjuge1: conjuge1,
      conjuge2: conjuge2,
      endereco: endereco,
      convidados: qtdConvidados,
      data: dataEvento,
    );

    EventoFirestore e = new EventoFirestore();
    e.store(note);
    print(note);
  }
}
