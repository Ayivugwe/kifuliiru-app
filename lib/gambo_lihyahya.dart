import 'package:flutter/material.dart';

class GamboLihyahya extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Gambo lihyahya"),
        ),
        body: new Checkbox(
            value: false,
            onChanged: (bool newValue) {
              Navigator.pop(ctxt); // Pop from stack
            }));
  }
}
