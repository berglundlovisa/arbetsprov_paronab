import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homepage_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Uppstart av firebase
  await Firebase.initializeApp();

//Kör app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Päron AB',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePageView(),
    );
  }
}
