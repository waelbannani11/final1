import 'package:flutter/material.dart';

class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  //final String img;
  final String title;
  final String subtitle;

  ActiveProjectsCard({
    this.cardColor,
    //this.img,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *0.4;
    return Expanded(
      flex: 1,
      child: Container(
        
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(15.0),
        height: 150,
        width: width,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
              
            Column(
           
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
