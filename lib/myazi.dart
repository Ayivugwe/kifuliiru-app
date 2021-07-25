import 'package:flutter/material.dart';

class Infos extends StatefulWidget {
  @override
  _InfosState createState() => _InfosState();
}

class _InfosState extends State<Infos> {
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
