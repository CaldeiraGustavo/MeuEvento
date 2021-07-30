import 'package:flutter/material.dart';
import 'package:meu_evento/app/routes/app_routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meu_evento/app/models/event.dart';
import 'package:meu_evento/app/db/events_database.dart';
import 'package:meu_evento/app/views/evento_form.dart';
import 'package:meu_evento/app/views/navigation_page.dart';
import 'package:meu_evento/app/widget/note_card_widget.dart';
import 'package:meu_evento/constants.dart';

import 'event_detail_page.dart';
import 'event_edit_page.dart';

class EventoList extends StatefulWidget {
  _EventList createState() => _EventList();
}

@override
class _EventList extends State <EventoList> {
  late List<Event> events;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    EventDatabase.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    this.events = await EventDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Eventos'),
        actions: <Widget>[
          Icon(Icons.search), SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : events.isEmpty
            ? Text(
          'Sem eventos cadastrados',
          style: TextStyle(color: Colors.white, fontSize: 24),
        )
            : buildNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EventoForm()),
          );
          refreshNotes();
        },
      ),
    );
  }

  Widget buildNotes() =>
      StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: events.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = events[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Navigation(noteId: note.id!),
              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
