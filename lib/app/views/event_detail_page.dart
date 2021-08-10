import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_evento/app/models/Evento.dart';
import 'package:meu_evento/app/db/events_database.dart';

import 'event_edit_page.dart';

class EventDetailPage extends StatefulWidget {
  final int noteId;

  const EventDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  late Event note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    this.note = await EventDatabase.instance.readNote(widget.noteId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 8),
                    Text(
                      note.conjuge1,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      note.conjuge2,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      note.dataEvento,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Convidados: " + note.qtdConvidados.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(event: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    onPressed: () async {
      await EventDatabase.instance.delete(widget.noteId);

      Navigator.of(context).pop();
    },
  );
}
