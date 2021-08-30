import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:meu_evento/app/views/convidados_page.dart';
import 'package:meu_evento/app/views/cronograma_page.dart';
import 'package:meu_evento/app/views/event_detail_page.dart';
import 'package:meu_evento/app/views/transaction_page.dart';
import 'package:meu_evento/app/views/contratos_page.dart';

class Navigation extends StatefulWidget {
  final dynamic note;
  const Navigation({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int pageIndex = 0;
  List<Widget> pageList = [];
  @override
  void initState() {
    super.initState();
    setState(() => {
          pageList = <Widget>[
            EventDetailPage(note: widget.note),
            cronogramaPage(noteId: widget.note.id),
            ConvidadosPage(noteId: widget.note.id),
            OrcamentoList(noteId: widget.note.id),
            ContratosPage(),
          ]
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: pageList[pageIndex],
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.pinkAccent,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex, // this will be set when a new tab is tapped
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Detalhes',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.watch_later),
            label: 'Cronograma',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: 'Convidados',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.paid),
            label: 'Orçamento',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera), label: 'Contratos')
        ],
      ),
    );
  }
}
