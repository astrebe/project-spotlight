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
                  Expanded(
                      child: Column(children: <Widget>[
                    const SizedBox(height: 5),
                    Text(
                      "Welcome to SpotLight! You can login or proceed without an account by clicking next!",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ])),
                  Expanded(
                      child: Column(children: <Widget>[
                    Text(
                      loginLabel,
                      style: const TextStyle(fontWeight: FontWeight.w900),
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
                    Text(
                      passwordLabel,
                      style: const TextStyle(fontWeight: FontWeight.w900),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.yellow),
                        ),
                        onPressed: () {},
                        child: const Text('Continue Without Account'),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                        ),
                        onPressed: () {},
                        child: const Text('Forgot Password',
                            style: TextStyle(color: Colors.blue)),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                        ),
                        onPressed: () {},
                        child: const Text('Create Account',
                            style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  )),
                ])),
          ],
        ));
  }
}
