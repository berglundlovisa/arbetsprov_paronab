import 'package:flutter/material.dart';
import 'package:my_first_app/views/jplattaviews/jplatta_main_view.dart';
import 'views/jtelefonviews/jtelefon_main_view.dart';
import 'views/paronklockaviews/paronklocka_main_view.dart';

//Första sidan i appen
class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

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
                      builder: (context) => const JPlattaMainView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.tablet),
                  title: Text('JPlatta'),
                  // subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JTelefonMainView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.smartphone),
                  title: Text('JTelefon'),
                  //   subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ParonklockaMainView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.watch),
                  title: Text('Päronklocka'),
                  //  subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

  /*  Kod som inte används just nu men kanske vill återanvända
     om jag vill hämta lista med data i firebase
     
            StreamBuilder<QuerySnapshot>(
                stream: widget._firestore.collection('products').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Expanded(
                    child: ListView.builder(
                        // scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          String itemTitle =
                              snapshot.data?.docs[index]['productname'];
                          dynamic itemQuantity =
                              snapshot.data?.docs[index]['productquantity'];
                          return CardItem(
                              itemTitle: itemTitle, itemQuantity: itemQuantity);
                        }),
                  );
                }),

//CardItem definierar innehållet av ett product-card
class CardItem extends StatefulWidget {
  String? itemTitle; //varje product behöver en titel
  dynamic itemQuantity; //varje producy behöver en quantity

  CardItem({this.itemTitle, this.itemQuantity});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: ListTile(
          title: Text(widget.itemTitle.toString()),
          subtitle: const Text('Totalt lagersaldo'),
          trailing: Text(widget.itemQuantity.toString()),
        ),
      ),
    );
  }
}*/


