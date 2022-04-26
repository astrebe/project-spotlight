import "package:flutter/material.dart";
import 'package:spotlight_app/RecalledProduct.dart';

class SpotlightFilterView extends StatefulWidget {
  const SpotlightFilterView({Key? key}) : super(key: key);

  @override
  _SpotlightfilterviewState createState() => _SpotlightfilterviewState();
}

class _SpotlightfilterviewState extends State<SpotlightFilterView> {
  var testText = "";
  var hazVal = "-";
  var catVal = "-";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 153, 0, 0),
          title: const Text("All Recall Products!!!"),
        ),
        body: Container(
            color: Colors.grey.shade200,
            child: Column(
              children: <Widget>[
                //Keyword Input,
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
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
                  ),
                ),

                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Hazard Type", style: TextStyle(fontSize: 13, color: Colors.grey)),
                        DropdownButton<String>(
                    value: hazVal,
                    icon: const Icon(Icons.arrow_downward_rounded),
                    iconSize: 12,
                    elevation: 16,
                    style: const TextStyle(color: Color.fromARGB(255, 153, 0, 0)),
                    underline: Container(
                      height: 2,
                      color: const Color.fromARGB(255, 153, 0, 0),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        hazVal = newValue!;
                      });
                    },
                    items: <String>['-', 'Exploding', "Chemical Burns", 'Falling']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Category", style: TextStyle(fontSize: 13, color: Colors.grey)),
                        DropdownButton<String>(
                    value: catVal,
                    icon: const Icon(Icons.arrow_downward_rounded),
                    iconSize: 12,
                    elevation: 16,
                    style: const TextStyle(color: Color.fromARGB(255, 153, 0, 0)),
                    underline: Container(
                      height: 2,
                      color: const Color.fromARGB(255, 153, 0, 0),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        catVal = newValue!;
                      });
                    },
                    items: <String>['-', 'Baby Carriers', "Furniture", 'Toys']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                      ]),


                  ],
                ),
                Row(
                  children: <Widget>[
                    
                  ],
                ),
                Row(
                  children: <Widget>[

                  ],
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
