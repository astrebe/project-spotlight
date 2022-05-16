import 'package:flutter/material.dart';
import 'dart:async';
import "package:firebase_auth/firebase_auth.dart";
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  String _firstName = "First Name";
  String _lastName = "Last Name";
  String _dob = "DOB";
  String _location = "Location";
  Color col = Color.fromARGB(255, 153, 0, 0);

  final prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.only(top: 100.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
            child: Text(
              "User Preferences",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "First Name:   ",
                ),
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (newText) {
                      setState(() {
                        _firstName = newText;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: _firstName,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                const Text("Last Name:   "),
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (newText) {
                      setState(() {
                        _lastName = newText;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: _lastName,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                const Text("Date of Birth:   "),
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (newText) {
                      setState(() {
                        _dob = newText;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: _dob,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                const Text("Location:    "),
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (newText) {
                      setState(() {
                        _location = newText;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: _location,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                const Text("Color:   "),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            col = Color.fromARGB(255, 153, 0, 0);
                          },
                          child: const Text('Red'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 153, 0, 0)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            col = Color.fromARGB(153, 0, 51, 255);
                          },
                          child: const Text('Blue'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(153, 0, 51, 255),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            col = Color.fromARGB(153, 0, 255, 0);
                          },
                          child: const Text('Green'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(153, 0, 255, 0),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 125,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Go Back!'),
                  ),
                ),
                SizedBox(
                  width: 125,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      SaveData(context);
                      RetrieveData(context);
                    },
                    child: const Text('Save'),
                  ),
                ),
              ])
            ]),
          ),
        ],
      )),
    );
  }

  void SaveData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('first', _firstName);
    await prefs.setString('last', _lastName);
    await prefs.setString('dob', _dob);
  }

  void RetrieveData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('first') != null) {
      String? name = prefs.getString('first');
      _firstName = name.toString();
    }
    if (prefs.getString('last') != null) {
      String? name = prefs.getString('last');
      _lastName = name.toString();
    }
    if (prefs.getString('dob') != null) {
      String? name = prefs.getString('dob');
      _dob = name.toString();
    }
  }

  Color getColor() {
    return col;
  }
}
