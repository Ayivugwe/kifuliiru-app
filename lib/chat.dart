import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final appTitle = 'Tuganuule';

  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const Text('Muyegerere!'),
    );
  }
}