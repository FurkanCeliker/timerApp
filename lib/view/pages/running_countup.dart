import 'package:flutter/material.dart';

class RunningCountup extends StatefulWidget {
  RunningCountup({Key? key}) : super(key: key);

  @override
  State<RunningCountup> createState() => _RunningCountupState();
}

class _RunningCountupState extends State<RunningCountup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Running Countup'),
      ),
      
    );
  }
}