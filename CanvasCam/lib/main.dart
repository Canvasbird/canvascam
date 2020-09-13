import 'package:flutter/material.dart';
import 'package:CanvasCam/screens/dashboard.dart';

void main() => runApp(CanvasCam());

class CanvasCam extends StatefulWidget {
  @override
  _CanvasCamState createState() => _CanvasCamState();
}

class _CanvasCamState extends State<CanvasCam> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CanvasCam',
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
