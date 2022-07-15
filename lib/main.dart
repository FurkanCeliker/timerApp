import 'package:flutter/material.dart';
import 'package:timer/view/pages/prepare_countdown.dart';
import 'package:timer/view/pages/prepare_countup.dart';
import 'package:timer/view/pages/prepare_tabata.dart';
import 'package:timer/view/pages/settings.dart';
import 'package:timer/view/running_countdown.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      home: Scaffold(
        body: PrepareCountUp(),
      ),
    );
  }
}