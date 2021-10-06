import 'package:flutter/material.dart';

class MyaziYitu extends StatelessWidget {
  const MyaziYitu({Key? key}) : super(key: key);
  final title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.green,
          child: Text('Myazi yitu hano'),
        ),
      ),
      body: Container(
        child: Text('Myazi yitu'),
      ),
    );
  }
}
