import 'package:flutter/material.dart';

class UmwaziDetail extends StatefulWidget {
  const UmwaziDetail({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _UmwaziDetailState createState() => _UmwaziDetailState();
}

class _UmwaziDetailState extends State<UmwaziDetail> {
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
