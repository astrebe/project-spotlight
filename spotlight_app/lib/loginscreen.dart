import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String loginLabel = "Login: ";
  final String passwordLabel = "Password: ";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColorLight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Text(
                    loginLabel,
                  ),
                  Text(
                    passwordLabel,
                  ),
                ])),
          ],
        ));
  }
}
