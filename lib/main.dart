import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
            const Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.smartphone),
                title: Text('JTelefon'),
                subtitle: Text('Lagersaldo: 250 000'),
                trailing: Icon(Icons.edit),
              ),
            ),
            const Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.tablet),
                title: Text('JPlatta'),
                subtitle: Text('Lagersaldo: 330 000'),
                trailing: Icon(Icons.edit),
              ),
            ),
            const Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.watch),
                title: Text('Päronklocka'),
                subtitle: Text('Lagersaldo: 288 000'),
                trailing: Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
