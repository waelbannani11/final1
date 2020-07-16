import 'package:final1/models/rdv_agenda.dart';
import 'package:final1/models/rdv_service.dart';
import 'package:final1/screens/datedialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class Modif extends StatefulWidget {
  @override
  _ModifState createState() => _ModifState();
}

class _ModifState extends State<Modif> {
  int _groupValue = -1;
  int _groupValue1 = -1;
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  DateTime from = DateTime(2015, 04, 07, 11, 0, 0);
  DateTime to = DateTime(2015, 04, 07, 11, 0, 0);

  void _handleRadioValueChanged(int value) {
    setState(() {
      this._groupValue = value;
    });
  }

  void _handleRadioValueChangedd(int value) {
    setState(() {
      this._groupValue1 = value;
    });
  }

  RDVSERVICE get rdvservice => GetIt.I<RDVSERVICE>();
  TextEditingController _subjectConttoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    final List countryList = ['celeb', 'marie', 'diforce'];

    //deb

    Widget buildSubject() {
      return TextFormField(
        controller: _subjectConttoller,
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

    //************************************************** */

    //*************************************************** */

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Ajouter Patient"),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                //key: _formKey,
                child: Column(
                  children: <Widget>[
                    //MyBackButton(),
                    SizedBox(
                      height: 15,
                    ),
                    buildSubject(),
                    builddate(),

                    GestureDetector(
                      onTap: () async {
                        final rdv = AddRdv(
                          subject: _subjectConttoller.text,
                          endTime: selectedDate.toString(),
                          startTime: selectedDate.toString(),
                        );
                        final result = await rdvservice.createRdv(rdv);
                        Navigator.pop(context);
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
