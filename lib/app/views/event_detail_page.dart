import 'package:flutter/material.dart';
import 'package:meu_evento/app/db/EventoFirestore.dart';

import 'event_edit_page.dart';

class EventDetailPage extends StatefulWidget {
  final dynamic note;

  const EventDetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isLoading = false;
  dynamic note;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    this.note = widget.note;
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
                      note['nome'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 8),
                    Text(
                      note['conjuge1'],
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      note["conjuge2"],
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      note["data"],
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Convidados: " + note['convidados'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Endereço: " + note['endereco'].toString(),
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
      EventoFirestore evt = new EventoFirestore();
      await evt.delete(widget.note.id);

      Navigator.of(context).pop();
    },
  );
}
