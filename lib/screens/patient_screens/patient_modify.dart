import 'package:final1/models/addpatient.dart';
import 'package:final1/models/patient_service.dart';
import 'package:final1/screens/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:final1/widgets/back_button.dart';
import 'package:final1/models/patient.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class PatientModify extends StatefulWidget {
  int id ;
  String nom ; 
  String prenom ; 
  PatientModify({this.id,this.nom,this.prenom});
  @override
  _PatientModifyState createState() => _PatientModifyState(id,nom,prenom);
}

class _PatientModifyState extends State<PatientModify> {

  int id; 
  String nom ; 
  String prenom ; 
  _PatientModifyState(this.id,this.nom,this.prenom);

  int _groupValue = -1;
  int _groupValue1 = -1;

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
  PatientService get patientService => GetIt.I<PatientService>();
  TextEditingController _idConttoller = TextEditingController();
  TextEditingController _nomConttoller = TextEditingController();
  TextEditingController _prenomConttoller = TextEditingController();

   

  @override
  Widget build(BuildContext context) {
     _idConttoller.text = (id).toString();
     _nomConttoller.text= nom;
     _prenomConttoller.text= prenom;


    final _formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    final List countryList = ['celeb', 'marie', 'diforce'];

    

    //nom
    Widget _buildnom() {
      return TextFormField(
        controller: _nomConttoller,
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
      );
    }

    //prenom
    Widget _buildprenom() {
      return TextFormField(
        controller: _prenomConttoller,
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
      );
    }

    //id
    Widget buildid() {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child:
            TextFormField(
              controller: _idConttoller,
              decoration: InputDecoration(
                  labelText: 'idpatient',
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
            ),
      );
    }

    //code
    Widget buildnumfiche() {
      return TextFormField(
        initialValue: '',
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
      );
    }
    //deb

    Widget builddatenai() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'Date de naissance',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'date de naissance is Required';
          }
          return null;
        },
      );
    }

    //gender
    Widget _genderRadio(int groupValue, handleRadioValueChanged) =>
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            'Sexe',
            style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged),
              Text(
                "Male",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Radio(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged),
              Text(
                "Female",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          )
        ]);

    //etatcivil
    Widget _etatcivil(int groupValue1, handleRadioValueChangedd) =>
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            'Etat civil',
            style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: groupValue1,
                  onChanged: handleRadioValueChangedd),
              Text(
                "celeb",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Radio(
                  value: 1,
                  groupValue: groupValue1,
                  onChanged: handleRadioValueChangedd),
              Text(
                "marie",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Radio(
                  value: 2,
                  groupValue: groupValue1,
                  onChanged: handleRadioValueChangedd),
              Text(
                "divorce",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          )
        ]);
    //nation
    Widget _buildnationn() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'nationnalite',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'nationnalite is Required';
          }
          return null;
        },
      );
    }

    //profession
    Widget _buildprofession() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'profession',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'profession is Required';
          }
          return null;
        },
      );
    }

    //teldom
    Widget _buildteldom() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'tel dom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) {
            return 'teldom is Required';
          }
          return null;
        },
      );
    }

    //    //telmob
    Widget _buildtelmob() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'tel mob',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) {
            return 'telmob is Required';
          }
          return null;
        },
      );
    }

    //adresse
    Widget _buildadresse() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'adresse',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 50,
        maxLines: 2,
        validator: (String value) {
          if (value.isEmpty) {
            return 'adresse is Required';
          }
          return null;
        },
      );
    }

    //ville
    Widget _buildville() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'ville',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'ville is Required';
          }
          return null;
        },
      );
    }

    //*************************************************** */

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Modifier Patient "),
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
                    SizedBox(
                      height: 15,
                    ),
                    buildid(),
                    buildnumfiche(),
                    _buildnom(),
                    _buildprenom(),
                    builddatenai(),
                    _genderRadio(_groupValue, _handleRadioValueChanged),
                    _etatcivil(_groupValue1, _handleRadioValueChangedd),
                    _buildnationn(),
                    _buildprofession(),
                    _buildteldom(),
                    _buildtelmob(),
                    _buildadresse(),
                    _buildville(),
                    GestureDetector(
                      onTap: () async{
                        final patient = AddPatient(
                          patientid: int.parse(_idConttoller.text), 
                          nom: _nomConttoller.text, 
                          prenom: _prenomConttoller.text, 
                          sex: "H", 
                          statusmatriomo_id: 1
                        );
                        final result = await patientService.updatePatient(patient);
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
