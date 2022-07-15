import 'package:flutter/material.dart';
import 'package:timer/constants/ui_constants.dart';

class PrepareCountdown extends StatefulWidget {
  PrepareCountdown({Key? key}) : super(key: key);
  
  
  
  @override
  State<PrepareCountdown> createState() => _PrepareCountdownState();
}

class _PrepareCountdownState extends State<PrepareCountdown> with TickerProviderStateMixin {
  late AnimationController controllerPrepare;
  bool isPlaying = false;
  double progress = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerPrepare = AnimationController(vsync: this,duration: Duration(seconds: 60));
  }
  @override
  void dispose() {
    controllerPrepare.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = Constants.getSizeHeight(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Stopwatch',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Go',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.only(top:height*0.1 ),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                onTap: (){

                },
                title: Text('Prepare'),
                subtitle: Text('Countdown before you start'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(':03',style: TextStyle(fontSize: 20),),
                    Icon(Icons.arrow_forward_ios,size: 25,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
