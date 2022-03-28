// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kifuliiru_app/umwazi.dart';

class Myazi extends StatefulWidget {
  const Myazi({Key? key}) : super(key: key);

  @override
  _MyaziState createState() => _MyaziState();
}

//List<Umwazi> items = [];
List items = getImyazi();

List getImyazi() {
  Umwazi umwazi = Umwazi(
      id: 1,
      title: 'Umwazi 1',
      kishushanyo: 'Kishushanyo 1',
      magamboMingi: 'Magambo 1');

  items.add(umwazi);
  Umwazi umwazi2 = Umwazi(
      id: 2,
      title: 'Umwazi 2',
      kishushanyo: 'Kishushanyo 2',
      magamboMingi: 'Magambo 2');

  items.add(umwazi2);

  Umwazi umwazi3 = Umwazi(
      id: 3,
      title: 'Umwazi 3',
      kishushanyo: 'Kishushanyo 3',
      magamboMingi: 'Magambo 3');

  items.add(umwazi3);
  Umwazi umwazi4 = Umwazi(
      id: 4,
      title: 'Umwazi 4',
      kishushanyo: 'Kishushanyo 4',
      magamboMingi: 'Magambo 4');

  items.add(umwazi4);

  print("items: $items.length");

  return items;
}

class _MyaziState extends State<Myazi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Myazi mu Kifuliiru',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].magamboMingi),
            );
          },
        ),
      ),
    );
  }
}
