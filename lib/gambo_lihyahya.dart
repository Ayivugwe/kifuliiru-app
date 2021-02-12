import 'package:flutter/material.dart';

class GamboLihyahya extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    final _formKey = GlobalKey<FormState>();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gambo lihyahya"),
      ),
      body: new Center(
        child: Column(
          children: [
            Text('Yandika igambo ne sobanuuro yalyo!'),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Yandikaigambo lye Kifuliiru hano',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Yandika igambo';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Yandika isobanuuro yalyo hano',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Yandika isobanuuro';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
                          // Process data.
                        }
                      },
                      child: Text('Bika'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
