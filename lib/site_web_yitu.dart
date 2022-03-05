import 'package:flutter/material.dart';

class SiteWebYitu extends StatelessWidget {
  const SiteWebYitu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Namuyehulo witu naho'),
      ),
      body: const Card(
        borderOnForeground: false,
        child: Text('Namuyehulo witu naho'),
      ),
    );
  }
}
