import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_evento/app/services/auth.dart';
import 'package:meu_evento/app/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meu_evento/constants.dart';

import 'app/views/evento_list.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static final String title = 'Meu evento';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          primaryColor: kButtonColor,
          scaffoldBackgroundColor: kContentColorLightTheme,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.yellow),
          )),
      home: StreamBuilder<User?>(
        stream: AuthService().getAuth().authStateChanges(),
        builder: (_, snapshot) {
          final isSignedIn = snapshot.data != null;
          return isSignedIn ? EventoList() : LoginScreen();
        },
      ),
    );
  }
}
