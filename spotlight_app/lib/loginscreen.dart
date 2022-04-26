import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String loginLabel = "Login: ";
  final String passwordLabel = "Password: ";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(top: 45.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Column(children: <Widget>[
              Expanded(
                  child: Column(children: <Widget>[
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome to SpotLight!",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              ])),
              Expanded(
                  child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    loginLabel,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ])),
              Expanded(
                  child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    passwordLabel,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ])),
              /*
        */
              Expanded(
                  child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                      ),
                      onPressed: () {},
                      child: const Text('Forgot Password',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {},
                      child: const Text('Continue Without Account'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {},
                      child: const Text('Create Account'),
                    ),
                  ])),
            ])),
          ],
        ));
  }
}
