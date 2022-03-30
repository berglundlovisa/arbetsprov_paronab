import 'package:flutter/material.dart';

class EditCupertinoJTelefonView extends StatelessWidget {
  const EditCupertinoJTelefonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cupertino inventory'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 30),
            const Text(
              ('Edit stock balance JTelefon Cupertino'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(height: 10),
            const Text('Stock balance Cupertino: 82 000'),
            Container(height: 20),
            editQuantityBox(),
          ],
        ),
      ),
    );
  }

  Widget editQuantityBox() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Update stock balance Cupertino',
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
          child: const Text('Save updated quantity'),
        ),
      ],
    );
  }
}
