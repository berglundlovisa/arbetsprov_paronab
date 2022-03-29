import 'package:flutter/material.dart';

class EditNorrkopingJTelefonView extends StatelessWidget {
  const EditNorrkopingJTelefonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Norrköping inventory'),
        actions: [
          ElevatedButton(
            //VET EJ OM DENNA SAVE KNAPP BÖR VARA KVAR
            onPressed: () {},
            child: const Text('Save',
                style: TextStyle(color: Colors.white, fontSize: 17)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 30),
            const Text(
              ('Edit stock balance JTelefon Norrköping'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(height: 10),
            const Text('Stock balance Norrköping: 84 000'),
            Container(height: 20),
            addQuantityBox(),
            Container(height: 10),
            subtractQuantityBox(),
          ],
        ),
      ),
    );
  }

  Widget addQuantityBox() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        Container(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: Text('Add quantity'),
        ),
      ],
    );
  }

  Widget subtractQuantityBox() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        Container(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: Text('Subtract quantity'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
      ],
    );
  }
}
