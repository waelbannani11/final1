import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:final1/widgets/back_button.dart';
import 'package:final1/widgets/my_text_field.dart';
import 'package:final1/screens/home_page.dart';
import 'search.dart';
import 'package:final1/models/patient.dart';
import 'calendar_page.dart';
import 'package:final1/models/rdv.dart';

class Consultation extends StatelessWidget {
  final Patient patient;
  final Rdv rdv;
  Consultation({this.patient, this.rdv});

  @override
  Widget build(BuildContext context) {
    //final patient =Provider.of<List<Patient>>(context)?? [];
    final _formKey = GlobalKey<FormState>();
    final Post post = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    //nom
    Widget _buildrdvid() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'rdvid',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          patient.nom = value;
        },
      );
    }

    //prenom
    Widget _buildmotif() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'motif',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'lastname is Required';
          }

          return null;
        },
        onSaved: (String value) {
          patient.prenom = value;
        },
      );
    }

    //id
    Widget buildid() {
      return TextFormField(
        //initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'patient id',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'id is Required';
          }

          return null;
        },
        onSaved: (String value) {
          patient.nom = value;
        },
      );
    }

    //num_fiche
    Widget buildnumfiche() {
      return TextFormField(
        //initialValue: '$post.title /20',
        decoration: InputDecoration(
            labelText: 'Num_fiche',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 30,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Num_fiche is Required';
          }

          return null;
        },
        onSaved: (String value) {
          rdv.pid = value;
        },
      );
    }
    //deb

    Widget builddatedeb() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'Date de consultation',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'date is Required';
          }

          return null;
        },
        onSaved: (String value) {
          rdv.dateDeb = value;
        },
      );
    }

    //fin
    Widget builddatefin() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'Date de fin',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'datefin is Required';
          }

          return null;
        },
        onSaved: (String value) {
          rdv.dateFin = value;
        },
      );
    }

    //pressionsyst
    Widget buildpressionsyst() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'pressionsyst',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'pressionsyst is Required';
          }
          return null;
        },
        onSaved: (String value) {
          rdv.type = value;
        },
      );
    }

    //pressiondiast
    Widget buildpressiondiast() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'pressiondiast',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'pressiondiast is Required';
          }
          return null;
        },
        onSaved: (String value) {
          rdv.type = value;
        },
      );
    }

    //temperature
    Widget buildtemperature() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'temperature',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'temperature is Required';
          }
          return null;
        },
        onSaved: (String value) {
          rdv.type = value;
        },
      );
    }

    Widget buildpoids() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'poids',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'poids is Required';
          }
          return null;
        },
        onSaved: (String value) {
          //rdv.type = value;
        },
      );
    }

    Widget buildtaille() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'taille',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'taille is Required';
          }
          return null;
        },
        onSaved: (String value) {
          //rdv.type = value;
        },
      );
    }

    Widget buildrdvid() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'rdvid',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'rdvid is Required';
          }
          return null;
        },
        onSaved: (String value) {
          rdv.type = value;
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Consultation"),
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
                      buildid(),
                      //buildnumfiche(),
                      _buildrdvid(),
                      _buildmotif(),
                      builddatedeb(),
                      //builddatefin(),
                      buildpressionsyst(),
                      buildpressiondiast(),
                      buildtemperature(),
                      buildtemperature(),
                      buildpoids(),
                      buildtaille(),
                      buildrdvid(),
                      //buildsujet(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalendarPage()),
                          );
                          //if (!_formKey.currentState.validate()) {
                          //return;
                          //}
                          //_formKey.currentState.save();
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
                ),
              ),
            ),
          
        ),
      ),
    );
  }
}