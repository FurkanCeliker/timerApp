import 'package:flutter/material.dart';
import 'package:timer/constants/ui_constants.dart';

class PrepareTabata extends StatefulWidget {
  PrepareTabata({Key? key}) : super(key: key);

  @override
  State<PrepareTabata> createState() => _PrepareTabataState();
}

class _PrepareTabataState extends State<PrepareTabata> {
  @override
  Widget build(BuildContext context) {
    double _width = Constants.getSizeWidth(context);
    double _height = Constants.getSizeHeight(context);
    return Scaffold(
      
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        
        centerTitle: true,
        title: Text('Tabata',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Go',
              style: TextStyle(fontSize: 20),
            ),),
          
      ]),
      body: Padding(
        padding: EdgeInsets.only(top: _height * 0.1),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: [
              buildListTile(
                  title: 'Prepare', subtitle: 'Countdown before you start'),
              buildListTile(
                  title: 'Work', subtitle: 'Do exercise for this long'),
              buildListTile(title: 'Rest', subtitle: 'Rest for this long'),
              buildListTile(
                  title: 'Rounds', subtitle: 'One Round is Work + Rest'),
              buildListTile(title: 'Cycles', subtitle: 'One Cycle is 8 Rounds'),
              buildListTile(
                  title: 'Rest Between Cycles', subtitle: 'Recovery Interval'),
            ],
          ),
        ),
      ),
    );
  }

  Card buildListTile({
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            ':05',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 5),
          Icon(
            Icons.arrow_forward_ios,
            size: 25,
          ),
        ]),
      ),
    );
  }
}
