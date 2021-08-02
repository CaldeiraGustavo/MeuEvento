import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:meu_evento/app/views/event_detail_page.dart';
import 'package:meu_evento/app/views/transaction_page.dart';

class Navigation extends StatefulWidget {
  final int noteId;
  const Navigation({
    Key? key,
    required this.noteId,
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
        EventDetailPage(noteId: widget.noteId),
        OrcamentoList()
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
              icon: Icon(Icons.photo_camera),
              label: 'Contratos'
          )
        ],
      ),
    );
  }
}
