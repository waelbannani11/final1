import 'package:final1/widgets/back_button.dart';
import 'package:final1/widgets/nv_patient_button.dart';
import 'package:flutter/material.dart';
import 'package:final1/widgets/chercher_patient_button.dart';

class ChercherAjouter extends StatelessWidget {
  const ChercherAjouter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: MyBackButton()),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
                      child: Chercherbutton(),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      child: Nvpatient(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
