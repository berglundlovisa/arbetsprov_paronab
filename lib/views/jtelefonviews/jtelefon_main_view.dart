import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'jtelefon_cupertino_view.dart';
import 'jtelefon_frankfurt_view.dart';
import 'jtelefon_norrkoping_view.dart';

//Första sidan för JTelefon
class JTelefonMainView extends StatefulWidget {
  const JTelefonMainView({Key? key}) : super(key: key);

  @override
  State<JTelefonMainView> createState() => _JTelefonMainViewState();
}

class _JTelefonMainViewState extends State<JTelefonMainView> {
  //variabler som används för att beräkna totalt lagersaldo
  var num1 = 0, num2 = 0, num3 = 0, sum = 0;

//funktion för att räkna ut totalt lagersaldo
  void calcTotalSumJTelefon() async {
    var collection = FirebaseFirestore.instance.collection('jTelefon');
    var docSnapshot = await collection.doc('jTelefonID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedCupertinoquantity = data['jTelefonCupertinoQuantity'];
      var jtelefonsavedFrankfurtquantity = data['jTelefonFrankfurtQuantity'];
      var jtelefonsavedNorrkopingquantity = data['jTelefonNorrkopingQuantity'];

      if (!mounted) return; //ta bort om något knasar

      setState(() {
        num1 = jtelefonsavedNorrkopingquantity;
        num2 = jtelefonsavedCupertinoquantity;
        num3 = jtelefonsavedFrankfurtquantity;
        sum = num1 + num2 + num3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    calcTotalSumJTelefon(); //lagersaldo räknas ut när sidan byggs upp
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
            Text(
              'Totalt lagersaldo JTelefon: $sum ',
              style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JTelefonCupertinoView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Cupertino'),
                  subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            Container(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JTelefonFrankfurtView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Frankfurt'),
                  subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            Container(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JTelefonNorrkopingView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Norrköping'),
                  subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
