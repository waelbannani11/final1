import 'package:flutter/material.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:final1/widgets/back_button.dart';
import 'package:final1/widgets/my_text_field.dart';
import 'package:final1/screens/home_page.dart';

import 'calendar_page.dart';

class CreateNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      backgroundColor:Colors.blue[100],
      body: SafeArea(
    
       child: DraggableScrollableSheet(
         initialChildSize: 1,
         builder: (context,scrollController){
           return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    width: width,
                    child: Column(
                      children: <Widget>[
                        MyBackButton(),
                        SizedBox(
                          height: 15,
                        ),
                        
                        SizedBox(height: 2),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyTextField(label: 'Title'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: MyTextField(
                                    label: 'Date',
                                    icon: downwardIcon,
                                  ),
                                ),
                                HomePage.calendarIcon(),
                              ],
                            ),
                            
                             Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                    child: MyTextField(
                                    label: 'Start Time',
                                    icon: downwardIcon,
                                    )
                                  ),
                                  SizedBox(width: 40),
                                  Expanded(
                                    child: MyTextField(
                                    label: 'End Time',
                                    icon: downwardIcon,
                                  ),
                                ),

                                  ],
                            ), 
                          ],
                        ))
                      ],
                    ),
                  ),
                  
                  
                  GestureDetector(
                    onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                      child: Container(
                      height: 80,
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'valider',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                            width: width - 40,
                            decoration: BoxDecoration(
                              color: LightColors.kBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
            ),
           );
           },
        
           ),
          ),
        );
      }
    }
