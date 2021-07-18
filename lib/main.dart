import 'package:flutter/material.dart';

import 'package:meu_evento/app/provider/Events.dart';
import 'package:provider/provider.dart';

import 'app/routes/app_routes.dart';
import 'app/views/evento_form.dart';
import 'app/views/evento_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Events(),
        ),
      ],
      child: MaterialApp(
          title: 'Meu Evento',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRoutes.HOME: (_) => EventoList(),
            AppRoutes.EVENT_FORM: (_) => EventoForm()
          }),
    );
  }
}


