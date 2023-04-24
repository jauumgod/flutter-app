import 'package:flutter/material.dart';
import 'package:flutter_app_gerenciamentos/screens/home/components/body.dart';
import 'package:flutter_app_gerenciamentos/screens/home/components/speed_dial.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: buildSpeedDial(context),
    );
  }
}
