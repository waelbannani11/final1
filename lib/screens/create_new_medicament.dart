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

class NewMedicament extends StatelessWidget {
  final Patient patient;
  final Rdv rdv;
  NewMedicament({this.patient, this.rdv});

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
    //Code_PCT
    Widget _buildCode_PCT() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'Code_PCT',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Code_PCT is Required';
          }
          return null;
        },
        onSaved: (String value) {
        },
      );
    }

    //Design
    Widget _buildDesign() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'Design',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Design is Required';
          }
          return null;
        },
        onSaved: (String value) {
        },
      );
    }

    //Labo
    Widget _buildLabo() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'Labo',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Labo is Required';
          }
          return null;
        },
        onSaved: (String value) {
        },
      );
    }

    //PVP
    Widget _buildPVP() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'PVP',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'PVP is Required';
          }
          return null;
        },
        onSaved: (String value) {
        },
      );
    }

    //PRIX_REF
    Widget _buildPRIX_REF() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'PRIX_REF',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'PRIX_REF is Required';
          }
          return null;
        },
        onSaved: (String value) {
        },
      );
    }

    //MONT_REMB
    Widget _buildMONT_REMB() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'MONT_REMB',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'MONT_REMB is Required';
          }
          return null;
        },
        onSaved: (String value) {
        },
      );
    }

    //MONT_NPCH
    Widget _buildPRIX_REMB() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'MONT_NPCH',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'MONT_NPCH is Required';
          }
          return null;
        },
        onSaved: (String value) {
        },
      );
    }

    //MONT_NPCH
    Widget _buildPRIX_NPCH() {
      return TextFormField(
       // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'MONT_NPCH',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'MONT_NPCH is Required';
          }
          return null;
        },
        onSaved: (String value) {
        },
      );
    }
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Ajouter Medicament"),
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
                      _buildCode_PCT(),
                      _buildDesign(),
                      _buildPVP(),
                      _buildPRIX_REF(),
                      _buildMONT_REMB(),
                      _buildPRIX_NPCH(),
                      _buildDesign(),
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