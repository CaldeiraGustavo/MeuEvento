import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class cronogramaPage extends StatefulWidget {
  @override
  _cronogramaPageState createState() => _cronogramaPageState();
}

class _cronogramaPageState extends State<cronogramaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cronograma"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('cronograma').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center (child: CircularProgressIndicator());
            default:
              return ReorderableListView.builder(
                itemCount: (snapshot.data!).docs.length,
                onReorder: (oldIndex, newIndex) => setState(() {
                  final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

                  final user = (snapshot.data!).docs.toList().removeAt(oldIndex);
                  (snapshot.data!).docs.toList().insert(index, user);
                }),
                itemBuilder: (context, index) {
                  final user = (snapshot.data!).docs.toList()[index];

                  return buildUser(index, user);
                },
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: shuffleList,
      )
    );
  }

  Widget buildUser(int index, user) => ListTile(
    key: ValueKey(user),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    title: Text(user.descricao),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.delete, color: Colors.black),
          onPressed: () => remove(index),
        ),
      ],
    ),
  );

  void remove(int index) => setState(() => {});
  void shuffleList() => setState(() => {});
}
