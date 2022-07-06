import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IbiyandikeMuKifuliiru extends StatefulWidget {
  const IbiyandikeMuKifuliiru({Key? key}) : super(key: key);

  @override
  State<IbiyandikeMuKifuliiru> createState() => _IbiyandikeMuKifuliiruState();
}

class _IbiyandikeMuKifuliiruState extends State<IbiyandikeMuKifuliiru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Imiyandike mu Kifuliiru'),
      ),
    );
  }
}
