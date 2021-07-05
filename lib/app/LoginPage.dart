import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Meu Evento',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              SignInButton(
                Buttons.Google,
                text: "Login com Google",
                onPressed: () {},
              ),
              SizedBox(
                height: 15.0,
              ),
              SignInButton(
                Buttons.FacebookNew,
                text: "Login com Facebook",
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              SignInButton(
                Buttons.Twitter,
                text: "Login com Twitter",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
