import 'package:flutter/material.dart';
import 'package:meu_evento/app/db/events_database.dart';
import 'package:meu_evento/app/models/event.dart';
import 'package:meu_evento/app/widget/NoteFormWidget.dart';

class AddEditNotePage extends StatefulWidget {
  final Event? event;

  const AddEditNotePage({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late String nome;
  late String conjuge1;
  late String conjuge2;
  late int qtdConvidados;

  @override
  void initState() {
    super.initState();

    nome = widget.event?.nome ?? '';
    conjuge1 = widget.event?.conjuge1 ?? '';
    conjuge2 = widget.event?.conjuge2 ?? '';
    qtdConvidados = widget.event?.qtdConvidados ?? 0;
    //data = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            Nome: nome,
            Conjuge1: conjuge1,
            Conjuge2: conjuge2,
            QtdConvidados: qtdConvidados,
            onChangedNome: (isImportant) => setState(() => this.nome == nome),
            onChangedConjuge1: (number) =>
                setState(() => this.conjuge1 = number),
            onChangedConjuge2: (title) => setState(() => this.nome = title),
            onChangedConvidados: (description) =>
                setState(() => this.nome = nome),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = nome.isNotEmpty && conjuge2.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.purpleAccent,
        ),
        onPressed: addOrUpdateNote,
        child: Text('Salvar'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.event != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.event!.copy(
      nome: nome,
      conjuge1: conjuge1,
      conjuge2: conjuge2,
      qtdConvidados: qtdConvidados,
    );

    await EventDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Event(
      nome: nome,
      conjuge1: conjuge1,
      conjuge2: conjuge2,
      qtdConvidados: qtdConvidados,
      dataEvento: DateTime.now(),
    );

    await EventDatabase.instance.create(note);
  }
}
