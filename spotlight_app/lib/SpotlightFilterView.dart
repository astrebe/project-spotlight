import "package:flutter/material.dart";
import 'package:spotlight_app/RecalledProduct.dart';

class SpotlightFilterView extends StatefulWidget {
  const SpotlightFilterView({Key? key}) : super(key: key);

  @override
  _SpotlightfilterviewState createState() => _SpotlightfilterviewState();
}

class _SpotlightfilterviewState extends State<SpotlightFilterView> {
  var testText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 153, 0, 0),
          title: const Text("All Recall Products"),
        ),
        body: Container(
            color: Colors.grey.shade200,
            child: Column(
              children: <Widget>[
                //Keyword Input,
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 70,
                  child: TextFormField(
                    onChanged: (newText) {
                      setState(() {
                        testText = newText;
                      });
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Search Recalls',
                      hintText: 'Keywords',
                    ),
                    initialValue: "1",
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      color: Colors.cyan,
                      height: 60,
                      child: Text("I AM HERE!"),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[],
                ),
                Row(
                  children: <Widget>[],
                ),
                Container(
                    height: 100,
                    child: ElevatedButton(
                      child: Row(children: const <Widget>[
                        Icon(Icons.search),
                        Text("Search"),
                      ]),
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 153, 0, 0))),
                    ))
              ],
            )));
  }
}
