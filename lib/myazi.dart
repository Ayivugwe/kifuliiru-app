import 'package:flutter/material.dart';

class Myazi extends StatefulWidget {
  @override
  _MyaziState createState() => _MyaziState();
}

class _MyaziState extends State<Myazi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
          child: ListTile(
        leading: Icon(Icons.info_outline),
        trailing: Icon(Icons.details),
        title: Text('Itwe lyo\' mwazi'),
        subtitle: Text('Umwazi munini'),
        dense: true,
        onLongPress: () {},
        onTap: () {},
      )),
    );
  }
}
