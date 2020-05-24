import 'package:flutter/material.dart';


class TaskContainer extends StatelessWidget {
  final String title;
  final Color boxColor;
  
  TaskContainer({
    this.title, this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      padding: EdgeInsets.all(20.0),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          
        ],
      ),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(30.0)),
    );
  }
}