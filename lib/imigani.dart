import 'package:flutter/material.dart';

class Imigani extends StatefulWidget {
  const Imigani({super.key});

  @override
  State<Imigani> createState() => _ImiganiState();
}

class _ImiganiState extends State<Imigani> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imyazi mu Kifuliiru',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.orangeAccent,
        fontFamily: 'Roboto', // Customize your font family here
      ),
      home: const Column(
        children: [
          Text('Loonga imigani hano'),
          Text('Umugani 1'),
          Text('Umugani 2')
        ],
      ),
    );
  }
}