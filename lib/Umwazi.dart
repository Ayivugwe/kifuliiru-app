import 'package:flutter/material.dart';

class Umwazi extends StatefulWidget {
  const Umwazi({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _UmwaziState createState() => _UmwaziState();
}

class _UmwaziState extends State<Umwazi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const Center(
          child: Text(
            'Hano hagagenda imwazi ngisi gwo\'mundu agakiziba atola',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ));
  }
}
