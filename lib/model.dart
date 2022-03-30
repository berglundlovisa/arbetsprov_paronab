import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

//ProductItem definierar innehållet av en produkt
class ProductItem {
  String? id; //varje produkt behöver ett id
  String? productname; //varje produkt behöver en benämning
  int? productquantity; //varje produkt behöver ett antal(lagersaldo)

  ProductItem(
      {required this.id,
      required this.productname,
      required this.productquantity});

//Kopplar ihop olika värden mellan Dart och Firebase
  Map<String, dynamic> createMap() {
    return {
      'id': id,
      'productname': productname,
      'productquantity': productquantity,
    };
  }

//Här konverteras värdet från JSON till Dart
  ProductItem.fromIdAndJson(
      String idFromFirebase, Map<String, dynamic> parsedJSON)
      : id = idFromFirebase,
        productname = parsedJSON['productname'],
        productquantity = parsedJSON['productquantity'];
}

class MyState extends ChangeNotifier {
  final List<ProductItem> _list = [];

  List<ProductItem> get list => _list;
}
