import 'package:flutter/material.dart';

class BafuliiruScreen extends StatelessWidget {
  final String title;

  const BafuliiruScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF2C4356),
      ),
      body: const Center(
        child: Text('Bafuliiru History & People Content'),
      ),
    );
  }
}
