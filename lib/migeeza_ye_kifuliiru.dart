import 'package:flutter/material.dart';

class MigeezaYeKifuliiru extends StatefulWidget {
  const MigeezaYeKifuliiru({Key? key}) : super(key: key);

  @override
  State<MigeezaYeKifuliiru> createState() => _MigeezaYeKifuliiruState();
}

class _MigeezaYeKifuliiruState extends State<MigeezaYeKifuliiru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Migeeza ye\'Kifuliiru'),
      ),
    );
  }
}
