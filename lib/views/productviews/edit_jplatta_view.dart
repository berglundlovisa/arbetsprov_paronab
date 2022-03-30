import 'package:flutter/material.dart';

class EditJPlattaView extends StatelessWidget {
  const EditJPlattaView({Key? key}) : super(key: key);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.tablet),
                Text(
                  ('JPlatta'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(height: 10),
            const Text('Product number: P002'),
            Container(height: 20),
            GestureDetector(
              onTap: () {},
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Cupertino'),
                  subtitle: Text('Stock balance: 110 000'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Norrköping'),
                  subtitle: Text('Stock balance: 110 000'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Frankfurt'),
                  subtitle: Text('Stock balance: 110 000'),
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
