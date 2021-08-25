import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meu_evento/app/db/events_database.dart';
import 'package:meu_evento/app/models/Evento.dart';
import 'package:meu_evento/app/services/auth.dart';
import 'package:meu_evento/app/views/evento_form.dart';
import 'package:meu_evento/app/views/navigation_page.dart';
import 'package:meu_evento/app/widget/note_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventoList extends StatefulWidget {
  _EventList createState() => _EventList();
}

@override
class _EventList extends State<EventoList> {
  late List<Event> events;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Eventos'),
        actions: <Widget>[logoffButton()],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Evento').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("{$snapshot.error}");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return buildNotes(snapshot);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent.shade100,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EventoForm()),
          );
        },
      ),
    );
  }

  Widget buildNotes(snapshot) => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: (snapshot.data!).docs.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = (snapshot.data!).docs[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Navigation(note: note!),
              ));
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
  Widget logoffButton() => IconButton(
      icon: Icon(Icons.logout),
      onPressed: () async {
        await AuthService().signOut();
      });
}
