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

class CreateNewTaskPage extends StatelessWidget {
  final Patient patient;
  final Rdv rdv;
  CreateNewTaskPage({this.patient, this.rdv});

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
    Widget _buildnom() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'nom',
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
    Widget _buildprenom() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'prenom',
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
            labelText: 'id',
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
            labelText: 'Date de debut',
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

    //type
    Widget buildtype() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'type',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'type is Required';
          }

          return null;
        },
        onSaved: (String value) {
          rdv.type = value;
        },
      );
    }

    //sujet
    Widget buildsujet() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'sujet',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLines: 5,
        maxLength: 300,
        validator: (String value) {
          if (value.isEmpty) {
            return 'sujet is Required';
          }

          return null;
        },
        onSaved: (String value) {
          rdv.sujet = value;
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: DraggableScrollableSheet(
          initialChildSize: 1,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                margin: EdgeInsets.all(24),
                child: Form(
                  //key: _formKey,
                  child: Column(
                    children: <Widget>[
                      MyBackButton(),
                      Container(
                        padding: EdgeInsets.all(0.0),
                        height: 50,
                        width: 100,
                        child: Text(
                          ' rendez-vous',
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      buildid(),
                      buildnumfiche(),
                      _buildnom(),
                      _buildprenom(),
                      builddatedeb(),
                      builddatefin(),
                      buildtype(),
                      buildsujet(),
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
            );
          },
        ),
      ),
    );
  }
}
