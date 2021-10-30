import 'package:flutter/material.dart';

class Myazi extends StatefulWidget {
  @override
  _MyaziState createState() => _MyaziState();
}

class _MyaziState extends State<Myazi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Myazi'),
      ),
      body: Center(
          child: ListTile(
        leading: Icon(Icons.circle_sharp),
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
