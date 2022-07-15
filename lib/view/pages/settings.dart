import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer/constants/ui_constants.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool audioControl = false;
  @override
  Widget build(BuildContext context) {
    double _width = Constants.getSizeWidth(context);
    double _height = Constants.getSizeHeight(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
          padding:  EdgeInsets.only(top: _height*0.2),
          child: 
      Column(children: [
        Card(
              elevation: 4,
              child: ListTile(
                title:const Text('Audio Assist'),
                subtitle:const Text('Athlets will count you down'),
                trailing: CupertinoSwitch(
                    onChanged: (value) {
                      setState(() {
                        audioControl = value;
                      });
                      
                    },
                    value: audioControl),
              )),
              
        
      ]),
    ));
  }
}
