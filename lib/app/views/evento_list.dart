import 'package:flutter/material.dart';
import 'package:meu_evento/app/components/event_tile.dart';
import 'package:meu_evento/app/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:meu_evento/app/provider/Events.dart';

class EventoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Events events = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Eventos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.EVENT_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: events.count,
        itemBuilder: (ctx, i) => EventTile(events.byIndex(i)),
      ),
    );
  }
}
