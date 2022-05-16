import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'LoginScreen.dart';
import 'package:spotlight_app/RecalledProductDatabase.dart';
import 'package:spotlight_app/SpotlightFilterView.dart';
import 'SpotlightViewFrame.dart';
import 'userSettings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 153, 0, 0),
      ),
      routes: {
        "/": (context) => const MyHomePage(title: 'Spotlight Login Screen'),
        "/SpotlightView": (context) => const SpotlightViewFrame(),
        //"/filter": (context) => const SpotlightFilterView(),
      },
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: const UserSettings(),
    );
  }
}
