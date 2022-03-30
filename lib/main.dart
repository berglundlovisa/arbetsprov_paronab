import 'package:flutter/material.dart';

import 'views/productviews/edit_jplatta_view.dart';
import 'views/productviews/edit_jtelefon_view.dart';
import 'views/productviews/edit_paronklocka_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Päron AB',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Päron AB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 30),
            const Text(
              ('Products'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditJTelefonView()),
                );
              },
              //JTelefon ska fungera att ändra lagersaldo för
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.smartphone),
                  title: Text('JTelefon'),
                  subtitle: Text(
                      'Total stock balance: 250 000'), //FÅ LAGERSALDO FRÅN FIRESTORE
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditJPlattaView()),
                );
              },
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.tablet),
                  title: Text('JPlatta'),
                  subtitle: Text(
                      'Total stock balance: 330 000'), //FÅ LAGERSALDO FRÅN FIRESTORE
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditParonklockaView()),
                );
              },
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.watch),
                  title: Text('Päronklocka'),
                  subtitle: Text(
                      'Total stock balance: 288 000'), //FÅ LAGERSALDO FRÅN FIRESTORE
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
