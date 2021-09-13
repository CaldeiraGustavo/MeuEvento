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
          title: Text("Detalhes do evento"),
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          note['nome'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Nome do evento',
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          note['conjuge1'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Conjuge 1',
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          note['conjuge2'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Conjuge 2',
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          note['data'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Data',
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          note['convidados'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Quantidade de convidados',
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          note['endereco'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Endereço',
                        ),
                      ),
                    ),
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
