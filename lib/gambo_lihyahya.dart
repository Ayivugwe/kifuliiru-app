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
            Text('Muyegerere!'),
             Text('Mugweti igambo lihyahya kwandi li isobaanuro?'),
              Text('Mutumenyeese hano ku namuyeeholo witu.'),

          ] 
        ),
      ),
    );
  }
}
