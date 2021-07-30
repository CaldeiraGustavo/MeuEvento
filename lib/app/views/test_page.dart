import 'package:flutter/material.dart';

class TesteNavigation extends StatelessWidget {
  const TesteNavigation({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ),
      );
  }
}
