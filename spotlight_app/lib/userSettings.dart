import 'package:flutter/material.dart';
import 'dart:async';
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:spotlight_app/SpotlightViewFrame.dart';
import 'userPreferences.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  String _firstName = "First Name";
  String _lastName = "Last Name";
  String _dob = "DOB";
  String _retailer = "retailer";

  List<String> retailers = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    retailers.clear();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    var preferences =
        firestore.collection("user-preferences").doc(auth.currentUser!.uid);
    var snapshot = await preferences.get();

    for (var preference in snapshot.data()!["retailers"]) {
      retailers.add(preference);
    }
    setState(() {});
  }

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
              "User Settings",
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
                const Text("Add Retailer:    "),
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (newText) {
                      setState(() {
                        _retailer = newText;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: _retailer,
                    ),
                  ),
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          retailers.add(_retailer);
                        },
                        child: const Text("Add")))
              ],
            ),
          ),
          Flexible(
              child: Row(children: [
            Text("Current Retailers: ${retailers.join(", ")}"),
            Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      retailers.clear();
                    },
                    child: const Text("Clear")))
          ])),
          Flexible(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Go Back!'),
                  ),
                ),
                SizedBox(
                  width: 115,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPreferences()));
                    },
                    child: const Text('Change Preferences'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      FirebaseFirestore db = FirebaseFirestore.instance;
                      FirebaseAuth auth = FirebaseAuth.instance;
                      final ret = <String, List<String>>{
                        "retailers": retailers
                      };
                      db
                          .collection("user-preferences")
                          .doc(auth.currentUser!.uid)
                          .set(ret)
                          .onError(
                              (e, _) => print("Error writing document: $e"));
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
}
