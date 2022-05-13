import 'package:flutter/material.dart';
import 'package:spotlight_app/RecalledProductDatabase.dart';
import 'package:spotlight_app/SpotlightFilterView.dart';
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
        "/": (context) => const MyHomePage(),
        "/SpotlightView": (context) => const SpotlightViewFrame(),
        //"/filter": (context) => const SpotlightFilterView(),
      },
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App")),
      body: const Text("List Goes Here"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/SpotlightView");
        },
        tooltip: 'Add Grocery Item to List',
        child: const Icon(Icons.add),
      ),
    );
  }
}
