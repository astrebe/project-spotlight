import 'package:flutter/material.dart';
import 'SpotlightViewFrame.dart';

void main() {
  runApp(MyApp());
}

//--
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mark's Grocery List",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => MyHomePage(),
        "/SpotlightView": (context) => SpotlightViewFrame(),
      },
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App")),
      body: Text("List Goes Here"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/SpotlightView");
        },
        tooltip: 'Add Grocery Item to List',
        child: Icon(Icons.add),
      ),
    );
  }
}
