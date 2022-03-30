import 'package:flutter/material.dart';

import '../warehouseviews/cupertino_jtelefon_view.dart';
import '../warehouseviews/frankfurt_jtelefon_view.dart';
import '../warehouseviews/norrkoping_jtelefon_view.dart';

class EditJTelefonView extends StatelessWidget {
  const EditJTelefonView({Key? key}) : super(key: key);

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
                Icon(Icons.smartphone),
                Text(
                  ('JTelefon'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(height: 10),
            const Text('Product number: P001'),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditCupertinoJTelefonView()),
                );
              },
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Cupertino'),
                  subtitle: Text('Stock balance: 82 000'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditNorrkopingJTelefonView()),
                );
              },
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Norrköping'),
                  subtitle: Text('Stock balance: 84 000'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditFrankfurtJTelefonView()),
                );
              },
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Frankfurt'),
                  subtitle: Text('Stock balance: 84 000'),
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
