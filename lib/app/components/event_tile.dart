//import 'package:flutter/material.dart';
//import 'package:meu_evento/app/routes/app_routes.dart';
//import 'package:meu_evento/app/db/Events.dart';
//import 'package:provider/provider.dart';
//import 'package:meu_evento/app/models/event.dart';
//
//class EventTile extends StatelessWidget {
//  final Evento event;
//
//  const EventTile(this.event);
//
//  @override
//  Widget build(BuildContext context) {
//    return ListTile(
//      leading: Icon(Icons.event_note),
//      title: Text(event.nome),
//      subtitle: Text(event.data),
//      trailing: Container(
//        width: 100,
//        child: Row(
//          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.edit),
//              color: Colors.orange,
//              onPressed: () {
//                Navigator.of(context).pushNamed(
//                  AppRoutes.EVENT_FORM,
//                  arguments: event,
//                );
//              },
//            ),
//            IconButton(
//              icon: Icon(Icons.delete),
//              color: Colors.red,
//              onPressed: () {
//                showDialog(
//                  context: context,
//                  builder: (ctx) =>
//                      AlertDialog(
//                        title: Text('Excluir Evento'),
//                        content: Text('Tem certeza???'),
//                        actions: <Widget>[
//                          FlatButton(
//                            child: Text('Não'),
//                            onPressed: () => Navigator.of(context).pop(false),
//                          ),
//                          FlatButton(
//                            child: Text('Sim'),
//                            onPressed: () => Navigator.of(context).pop(true),
//                          ),
//                        ],
//                      ),
//                ).then((confimed) {
//                  if (confimed) {
//                    Provider.of<Events>(context, listen: false).remove(event);
//                  }
//                });
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
