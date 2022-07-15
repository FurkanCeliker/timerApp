import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:timer/constants/ui_constants.dart';

class PrepareCountUp extends StatefulWidget {
  PrepareCountUp({Key? key}) : super(key: key);

  @override
  State<PrepareCountUp> createState() => _PrepareCountUpState();
}

class _PrepareCountUpState extends State<PrepareCountUp>
    with TickerProviderStateMixin {
  late AnimationController controllerPrepare;
  late AnimationController controllerStartTime;
  double progress = 1.0;
  bool isPlaying=false;
  bool isPlayinStart=false;

  String get countText {
    Duration count = controllerPrepare.duration! * controllerPrepare.value;
    return controllerPrepare.isDismissed
        ? '${(controllerPrepare.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controllerPrepare.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  String get countTextStart {
    Duration count = controllerStartTime.duration! * controllerStartTime.value;
    return controllerStartTime.isDismissed
        ? '${(controllerStartTime.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controllerStartTime.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerPrepare =
        AnimationController(vsync: this, duration: Duration(seconds: 60));

    controllerStartTime =
        AnimationController(vsync: this, duration: Duration(seconds: 60));

    controllerPrepare.addListener(() { 
      notify();
      if(controllerPrepare.isAnimating){
        progress =controllerPrepare.value;
      }else {
        setState(() {
          progress=1.0;
          isPlaying =false;
        });
      }
    });

  controllerStartTime.addListener(() { 
      notify();
      if(controllerStartTime.isAnimating){
        progress =controllerStartTime.value;
      }else {
        setState(() {
          progress=1.0;
          isPlayinStart =false;
        });
      }
    });

  }

  @override
  void dispose() {
    controllerPrepare.dispose();
    controllerStartTime.dispose();
    super.dispose();
  }


  void notify(){
    if(countText=='00:00'){
      FlutterRingtonePlayer.playNotification();
    }
  }

  

  @override
  Widget build(BuildContext context) {
    double _width = Constants.getSizeWidth(context);
    double _height = Constants.getSizeHeight(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Go',
                style: TextStyle(fontSize: 20),
              ))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: const Text(
          'AMRAP',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: _height * 0.1),
        child: Column(children: [
          buildListTile(context, _height,'Prepare','Countdown before you start',controllerPrepare,countText),
          buildListTile(context, _height, 'Start Time', 'Total duration of work', controllerStartTime,countTextStart),
          
        ]),
      ),
    );
  }

  Card buildListTile(BuildContext context, double _height,String title,String subtitle,AnimationController controller,String getCount) {
    return Card(
          elevation: 5,
          child: ListTile(
            onTap: () {
              
              if(controller.isDismissed){showBottomSheet(context: context, builder: (context)=> SizedBox(
                height: _height*0.3,
                child: CupertinoTimerPicker(
                  
                  mode: CupertinoTimerPickerMode.ms,
                  initialTimerDuration: controller.duration!,
                  onTimerDurationChanged: (time) {
                  setState(() {
                    controller.duration = time;
                  });
                }),
              ) );}
              
              
             
            },
            title:  Text(title),
            subtitle:  Text(subtitle),
            trailing:  Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(getCount,style:const TextStyle(fontSize: 20),),
                const Icon(Icons.arrow_forward_ios,size: 25,),
              ],
            ),
          ),
        );
  }
}
