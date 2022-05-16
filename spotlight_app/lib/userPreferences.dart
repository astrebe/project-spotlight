import "package:flutter/material.dart";
import 'dart:async';
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'RecalledProductDatabase.dart';

class UserPreferences extends StatefulWidget {
  const UserPreferences({Key? key}) : super(key: key);

  @override
  _UserPreferencesFrameState createState() => _UserPreferencesFrameState();
}

class _UserPreferencesFrameState extends State<UserPreferences> {
  static RecalledProductDB? _db = RecalledProductDB();
  List<String> categories = _db!.uniqueCategories;

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
                      fontSize: 48,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ]),
              ),
              Flexible(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: []),
              )
            ])));
  }
}
