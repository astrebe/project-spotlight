import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String loginLabel = "Email: ";
  final String passwordLabel = "Password: ";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.only(top: 100.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Column(children: <Widget>[
              Expanded(
                  child: Column(children: const <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome to SpotLight!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              ])),
              Expanded(
                  child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      loginLabel,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ])),
              Align(
                alignment: Alignment.bottomCenter,
                child: Expanded(
                    child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        passwordLabel,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
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
              ),
              /*
        */
              Expanded(
                  child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      style: const ButtonStyle(
                        alignment: Alignment.center,
                      ),
                      onPressed: () {},
                      child: const Text('Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    SizedBox(
                      width: 175,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 153, 0, 0)),
                        ),
                        onPressed: () {},
                        child: const Text('Create Account'),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {},
                      child: const Text('Continue Without Account'),
                    ),
                  ])),
            ])),
          ],
        ));
  }
}
