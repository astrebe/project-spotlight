// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String loginLabel = "Email: ";
  final String passwordLabel = "Password: ";

  String _errorMessage = "";
  String _loginEmail = "";
  String _loginPassword = "";

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
                TextFormField(
                  obscureText: false,
                  autofocus: true,
                  onChanged: (newText) {
                    setState(() {
                      _loginEmail = newText;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                /*const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),*/
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
                  TextFormField(
                    autofocus: true,
                    onChanged: (newText) {
                      setState(() {
                        _loginPassword = newText;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  /*const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),*/
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
                      onPressed: () {
                        ForgotPassword(context);
                      },
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
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                    email: _loginEmail,
                                    password: _loginPassword);
                            /*Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Put Page Name Here));
                                */
                          } on FirebaseAuthException catch (e) {
                            if (e.code == "user-not-fount") {
                              _errorMessage = "No User Found for that Email.";
                            } else if (e.code == "wrong-password") {
                              _errorMessage =
                                  "Wrong Password Provided for User.";
                            }
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ])),
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
                      child: const Text("Continue Without Account"),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        NoAccountPopUp(context);
                      },
                    ),
                  ])),
            ])),
          ],
        ));
  }

  void GoBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future NoAccountPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are You Sure?'),
        content: const Text(
            "Not creating an account prevents you from being able to get the most out of SpotLight. SpotLight relies on collecting information in order to keep users up to date with the latest recalls in their area. Without your information the benefits of using SpotLight are greatly reduced."),
        actions: [
          TextButton(
            child: const Text("Go Back"),
            onPressed: () {
              GoBack(context);
            },
          ),
          TextButton(
            child: const Text("Proceed"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Future ForgotPassword(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Forgot Password'),
        content: const Text(
            "Please enter in your email associated with the account in order to retrieve your password!"),
        actions: [
          TextButton(
            child: const Text("Go Back"),
            onPressed: () {
              GoBack(context);
            },
          ),
          TextButton(
            child: const Text("Submit Request"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
