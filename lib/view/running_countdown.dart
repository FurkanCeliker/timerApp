import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:timer/constants/ui_constants.dart';

class RunningCountdown extends StatefulWidget {
  RunningCountdown({Key? key}) : super(key: key);

  @override
  State<RunningCountdown> createState() => _RunningCountdownState();
}

class _RunningCountdownState extends State<RunningCountdown>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = Constants.getSizeHeight(context);
    double _width = Constants.getSizeWidth(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [Color.fromARGB(15, 6, 221, 245),Color.fromARGB(15, 4, 95, 242)]  )),
        child: Column(
          
          children: [
            Expanded(
                child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: _width * 0.4,
                  height: _height * 0.25,
                  child: CircularProgressIndicator(
                    value: progress,
                    color: Colors.grey,
                    strokeWidth: 6,
                  ),
                ),
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(countText,style:const TextStyle(fontSize: 40),)),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
