import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  String _firstName = "";
  String _lastName = "";
  String _dob = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.only(top: 100.0),
      child: Center(
          child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "First Name:",
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
                    labelText: "First Name",
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Last Name:"),
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  onChanged: (newText) {
                    setState(() {
                      _lastName = newText;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Last Name",
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Date of Birth:"),
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  onChanged: (newText) {
                    setState(() {
                      _dob = newText;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "DOB",
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {},
            child: const Text('Go Back!'),
          ),
        ],
      )),
    );
  }
}
