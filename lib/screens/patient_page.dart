import 'package:flutter/material.dart';
class Patients extends StatefulWidget {
  @override
  _PatientsState createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
            child: Text('mes patients'),
        
      ),
    );
  }
}