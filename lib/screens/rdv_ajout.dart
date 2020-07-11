import 'package:flutter/material.dart';

class RDV extends StatefulWidget {
  @override
  _RDVState createState() => _RDVState();
}

Widget builddatedeb() {
  return TextFormField(
    initialValue: '',
    decoration: InputDecoration(
        labelText: 'from',
        border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(18.0),
            borderSide: new BorderSide())),
    keyboardType: TextInputType.datetime,
    maxLength: 10,
    validator: (String value) {
      if (value.isEmpty) {
        return 'datedeb is Required';
      }

      return null;
    },
  );
}

//////
Widget builddateFIN() {
  return TextFormField(
    initialValue: '',
    decoration: InputDecoration(
        labelText: 'to',
        border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(18.0),
            borderSide: new BorderSide())),
    keyboardType: TextInputType.datetime,
    maxLength: 10,
    validator: (String value) {
      if (value.isEmpty) {
        return 'datedeb is Required';
      }

      return null;
    },
  );
}

Widget buildSubject() {
  return TextFormField(
    initialValue: '',
    decoration: InputDecoration(
        labelText: 'subject',
        border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(18.0),
            borderSide: new BorderSide())),
    keyboardType: TextInputType.datetime,
    maxLength: 10,
    validator: (String value) {
      if (value.isEmpty) {
        return 'datedeb is Required';
      }

      return null;
    },
  );
}

class _RDVState extends State<RDV> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: <Widget>[buildSubject(), builddateFIN(), builddatedeb()],
      ),
    ));
  }
}
