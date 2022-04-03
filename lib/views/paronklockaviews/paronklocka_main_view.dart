import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'paronklocka_cupertino_view.dart';
import 'paronklocka_frankfurt_view.dart';
import 'paronklocka_norrkoping_view.dart';

//Första sidan för Päronklocka
class ParonklockaMainView extends StatefulWidget {
  const ParonklockaMainView({Key? key}) : super(key: key);

  @override
  State<ParonklockaMainView> createState() => _ParonklockaMainViewState();
}

class _ParonklockaMainViewState extends State<ParonklockaMainView> {
  //variabler som används för att beräkna totalt lagersaldo
  var num1 = 0, num2 = 0, num3 = 0, sum = 0;

//funktion för att räkna ut totalt lagersaldo
  void calcTotalSumParonklocka() async {
    var collection = FirebaseFirestore.instance.collection('paronklocka');
    var docSnapshot = await collection.doc('paronklockaID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var paronklockasavedCupertinoquantity =
          data['paronklockaCupertinoQuantity'];
      var paronklockasavedFrankfurtquantity =
          data['paronklockaFrankfurtQuantity'];
      var paronklockasavedNorrkopingquantity =
          data['paronklockaNorrkopingQuantity'];

      if (!mounted) return; //ta bort om något knasar

      setState(() {
        num1 = paronklockasavedNorrkopingquantity;
        num2 = paronklockasavedCupertinoquantity;
        num3 = paronklockasavedFrankfurtquantity;
        sum = num1 + num2 + num3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    calcTotalSumParonklocka(); //lagersaldo räknas ut när sidan byggs upp
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
                Icon(Icons.watch),
                Text(
                  ('Päronklocka'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(height: 10),
            const Text('Product number: P003'),
            Container(height: 20),
            Text(
              'Totalt lagersaldo: $sum',
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
                      builder: (context) => const ParonklockaCupertinoView(),
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
                      builder: (context) => const ParonklockaFrankfurtView(),
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
                      builder: (context) => const ParonklockaNorrkopingView(),
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
