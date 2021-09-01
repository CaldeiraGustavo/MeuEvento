import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth getAuth() {
    return _auth;
  }

  //signin anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signin with email and password
  Future signInWithEmail(mail, senha, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: senha);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Erro"),
                content: Text("Usuário ou senha inválidos."),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        print('No user found for that email.');
      } else {
        print(e.code);
      }
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
