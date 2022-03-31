import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_product_view.dart';
import 'model.dart';
import 'views/productviews/edit_jplatta_view.dart';
import 'views/productviews/edit_jtelefon_view.dart';
import 'views/productviews/edit_paronklocka_view.dart';

class HomePageView extends StatefulWidget {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
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
            StreamBuilder<QuerySnapshot>(
                stream: widget._firestore.collection('products').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            String itemTitle =
                                snapshot.data?.docs[index]['productname'];
                            String itemQuantity =
                                snapshot.data?.docs[index]['productquantity'];
                            return CardItem(
                                itemTitle: itemTitle,
                                itemQuantity: itemQuantity);
                          }));
                }),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatefulWidget {
  String? itemTitle;
  String? itemQuantity;

  CardItem({this.itemTitle, this.itemQuantity});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProductView(),
            ));
      },
      child: Card(
        child: ListTile(
          title: Text(widget.itemTitle.toString()),
          subtitle: Text(widget.itemQuantity.toString()),
        ),
      ),
    );
  }
}


/*
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  void _saveProduct() {
    final productName = _controller.text;

    FirebaseFirestore.instance
        .collection('products')
        .add({'name': productName});

    _controller.clear();
  }

  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.docs.length,
        itemBuilder: (context, index) {
          final doc = snapshot.docs[index];
          return Card(
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.smartphone),
              title: Text(doc['name']),
              subtitle: const Text('Lagersaldo'),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Päron AB'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter product',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _saveProduct();
            },
            child: const Text('Save'),
          ),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const LinearProgressIndicator();
                return Expanded(child: _buildList(snapshot.requireData));
              }),
        ],
      ),
    );
  }
}*/

      /* Center(
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
      ),*/
   
/*
class ProductList extends StatelessWidget {
  final List<ProductItem> list;

  const ProductList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children:
            list.map((product) => _productItem(context, product)).toList());
  }

  Widget _productItem(context, ProductItem product) {
    var state = Provider.of<MyState>(context, listen: false);
    return ListTile(
      title: Text(product.productname),
      subtitle: Text(product.productquantity),
    );
  }
}*/
