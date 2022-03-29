import 'package:flutter/material.dart';
import 'package:my_first_app/edit_jplatta_view.dart';
import 'package:my_first_app/edit_jtelefon_view.dart';
import 'package:my_first_app/edit_paronklocka_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Päron AB',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
              ('Produkter'),
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
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.smartphone),
                  title: Text('JTelefon'),
                  subtitle: Text('Lagersaldo: 250 000'),
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
                  subtitle: Text('Lagersaldo: 330 000'),
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
                  subtitle: Text('Lagersaldo: 288 000'),
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
