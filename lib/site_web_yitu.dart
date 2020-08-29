import 'package:flutter/material.dart';

class SiteWebYitu extends StatefulWidget {
  const SiteWebYitu({
    Key key,
    this.color = const Color(0xFFFFE306),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  _SiteWebYitu createState() => _SiteWebYitu();
}

class _SiteWebYitu extends State<SiteWebYitu> {
  double _size = 1.0;

  void grow() {
    setState(() {
      _size += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      transform: Matrix4.diagonal3Values(_size, _size, 1.0),
      child: widget.child,
    );
  }
}
