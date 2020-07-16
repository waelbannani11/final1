import 'package:final1/models/rdv_agenda.dart';
import 'package:final1/models/rdv_service.dart';
import 'package:final1/screens/datedialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:string_validator/string_validator.dart';

class ModifRDV extends StatefulWidget {
  @override
  _ModifRDVState createState() => _ModifRDVState();
}

class _ModifRDVState extends State<ModifRDV> {
  int groupValue1 = 1;

  void handleRadioValueChangedd(int value) {
    setState(() {
      this.groupValue1 = value;
    });
  }

  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  DateTime from = DateTime(2015, 04, 07, 11, 0, 0);

  RDVSERVICE get rdvservice => GetIt.I<RDVSERVICE>();
  TextEditingController _subjectConttoller = TextEditingController();
  TextEditingController _patientidConttoller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget buildSubject() {
      return TextFormField(
        controller: _subjectConttoller,
        decoration: InputDecoration(
            labelText: 'subject',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'datedeb is Required';
          }

          return null;
        },
      );
    }

    Widget builddate() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(dateFormat.format(selectedDate)),
          RaisedButton(
            child: Text('date de debut'),
            onPressed: () async {
              showDateTimeDialog(context, initialDate: selectedDate,
                  onSelectedDate: (selectedDate) {
                setState(() {
                  this.selectedDate = selectedDate;
                });
              });
            },
          )
        ],
      );
    }

    Widget buildpatientid() {
      return TextFormField(
        controller: _patientidConttoller,
        decoration: InputDecoration(
            labelText: 'Patient ID',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty || !isNumeric(value)) {
            return 'Patient ID is Required';
          }

          return null;
        },
      );
    }

    Widget _type(int groupValue1, handleRadioValueChangedd) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Type RDV',
              style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: groupValue1,
                      onChanged: handleRadioValueChangedd,
                    ),
                    Text("Controle"),
                    Radio<int>(
                      value: 2,
                      groupValue: groupValue1,
                      onChanged: handleRadioValueChangedd,
                    ),
                    Text("Consultation"),
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 3,
                      groupValue: groupValue1,
                      onChanged: handleRadioValueChangedd,
                    ),
                    Text("Conventionnée"),
                    Radio<int>(
                      value: 4,
                      groupValue: groupValue1,
                      onChanged: handleRadioValueChangedd,
                    ),
                    Text("Gratuit"),
                  ],
                ),
              ],
            )
          ]);
    }

    //*************************************************** */

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Ajouter RDV"),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    //MyBackButton(),
                    SizedBox(
                      height: 15,
                    ),
                    buildSubject(),
                    buildpatientid(),
                    builddate(),
                    _type(groupValue1, handleRadioValueChangedd),

                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          final rdv = AddRdv(
                            patientid: _patientidConttoller.text,
                            subject: _subjectConttoller.text,
                            endTime: selectedDate.toString(),
                            startTime: selectedDate.toString(),
                          );
                          final result = await rdvservice.modifRdv(rdv);
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 80,
                        width: width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              width: width / 1.3,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
