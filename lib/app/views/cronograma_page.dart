import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class cronogramaPage extends StatefulWidget {
  final String noteId;

  const cronogramaPage({Key? key, required this.noteId}) : super(key: key);

  @override
  _cronogramaPageState createState() => _cronogramaPageState();
}

class _cronogramaPageState extends State<cronogramaPage> {
  final _toDoController = TextEditingController();
  List _toDoList = [];
  late AsyncSnapshot<QuerySnapshot> snapshot;

  late Map<String, dynamic> _lastRemoved;
  late int _lastRemovedPos;

  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _toDoList = json.decode(data!);
      });
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
    print(widget.noteId);
    setState(() {
      _toDoList.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });

      _saveData();
    });

    return null;
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _toDoController.text;
      _toDoController.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);

      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cronograma"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Evento')
              .doc(widget.noteId)
              .collection('Cronograma')
              .snapshots(),
          builder:
              (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return new Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _toDoController,
                              decoration: InputDecoration(
                                  labelText: "Novo item",
                                  labelStyle:
                                  TextStyle(color: Colors.blueAccent)),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.blueAccent,
                            child: Text("ADD"),
                            textColor: Colors.white,
                            onPressed: _addToDo,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: RefreshIndicator(
                          onRefresh: _refresh,
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 10.0),
                              itemCount: _toDoList.length,
                          itemBuilder: buildItem2),
                    ))
                  ],
                );
            }
          }),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return new Dismissible(
      key: Key(DateTime
          .now()
          .millisecondsSinceEpoch
          .toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
          child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
        ),
        onChanged: (c) {
          setState(() {
            _toDoList[index]["ok"] = c;
            _saveData();
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_toDoList[index]);
          _lastRemovedPos = index;
          _toDoList.removeAt(index);

          //_saveData();

          final snack = SnackBar(
            content: Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();
                  });
                }),
            duration: Duration(seconds: 2),
          );

          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);

    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<String?> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Widget buildItem2(BuildContext context, int index) {
    return ListView(
      children: (snapshot.data!).docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data2 = document.data() as Map<String, dynamic>;
        return new Dismissible(
            key: Key(DateTime
                .now()
                .millisecondsSinceEpoch
                .toString()),
            background: Container(
              color: Colors.redAccent,
              child: Align(
                alignment: Alignment(-0.9, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            direction: DismissDirection.startToEnd,
            child: CheckboxListTile(
              title: Text(data2["title"]
              ),
              value: data2["ok"],
              secondary: CircleAvatar(
                child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
              ),
              onChanged: (c) {
                setState(() {
                  _toDoList[index]["ok"] = c;
                  _saveData();
                });
              },
            ),
            onDismissed: (direction) {
              setState(() {
                _lastRemoved = Map.from(_toDoList[index]);
                _lastRemovedPos = index;
                _toDoList.removeAt(index);

                final snack = SnackBar(
                  content:
                  Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
                  action: SnackBarAction(
                      label: "Desfazer",
                      onPressed: () {
                        setState(() {
                          _toDoList.insert(_lastRemovedPos, _lastRemoved);
                          _saveData();
                        });
                      }),
                  duration: Duration(seconds: 2),
                );
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context).showSnackBar(snack);
              });
            });
      }).toList(),
    );
  }
}
