import 'package:final1/models/addlogin.dart';
import 'package:final1/models/login_service.dart';
import 'package:final1/screens/home_page.dart';
import 'package:final1/screens/login.dart';
import 'package:final1/screens/patient_screens/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:string_validator/string_validator.dart';

class ModifierProfile extends StatefulWidget {
  String Code;
  String Prenom;
  String Nom;
  String Adresse;
  String Specialite;
  String Ville;
  String CodeP;
  String TelBur1;
  String TelBur2;
  String TelDom;
  String Gsm;
  String Email;
  String Fax;
  ModifierProfile(
      {this.Code,
      this.Prenom,
      this.Nom,
      this.Adresse,
      this.Specialite,
      this.Ville,
      this.CodeP,
      this.TelBur1,
      this.TelBur2,
      this.TelDom,
      this.Gsm,
      this.Email,
      this.Fax});
  @override
  _ModifierProfileState createState() => _ModifierProfileState(
        Code,
        Prenom,
        Nom,
        Adresse,
        Specialite,
        Ville,
        CodeP,
        TelBur1,
        TelBur2,
        TelDom,
        Gsm,
        Email,
        Fax,
      );
}

class _ModifierProfileState extends State<ModifierProfile> {
  String Code;
  String Prenom;
  String Nom;
  String Adresse;
  String Specialite;
  String Ville;
  String CodeP;
  String TelBur1;
  String TelBur2;
  String TelDom;
  String Gsm;
  String Email;
  String Fax;
  _ModifierProfileState(
      this.Code,
      this.Prenom,
      this.Nom,
      this.Adresse,
      this.Specialite,
      this.Ville,
      this.CodeP,
      this.TelBur1,
      this.TelBur2,
      this.TelDom,
      this.Gsm,
      this.Email,
      this.Fax);

  TextEditingController _codepConttoller = TextEditingController();
  TextEditingController _nomConttoller = TextEditingController();
  TextEditingController _prenomConttoller = TextEditingController();
  TextEditingController _adresseConttoller = TextEditingController();
  TextEditingController _specialiteConttoller = TextEditingController();
  TextEditingController _tel1Conttoller = TextEditingController();
  TextEditingController _tel2Conttoller = TextEditingController();
  TextEditingController _tel3Conttoller = TextEditingController();
  TextEditingController _gsmmobileConttoller = TextEditingController();
  TextEditingController _villeConttoller = TextEditingController();
  TextEditingController _emailConttoller = TextEditingController();
  TextEditingController _faxConttoller = TextEditingController();
  TextEditingController _codeConttoller = TextEditingController();
  LoginService get loginService => GetIt.I<LoginService>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _codeConttoller.text = Code;
    _nomConttoller.text = Nom;
    _prenomConttoller.text = Prenom;
    _codepConttoller.text = CodeP;
    _villeConttoller.text = Ville;
    _adresseConttoller.text = Adresse;
    _specialiteConttoller.text = Specialite;
    _faxConttoller.text = Fax;
    _gsmmobileConttoller.text = Gsm;
    _emailConttoller.text = Email;
    _tel1Conttoller.text = TelBur1;
    _tel2Conttoller.text = TelBur2;
    _tel3Conttoller.text = TelDom;
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    //nom
    Widget _buildfax() {
      return TextFormField(
        controller: _faxConttoller,
        decoration: InputDecoration(
            labelText: 'fax',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
      );
    }

    //nom
    Widget _buildemail() {
      return TextFormField(
        controller: _emailConttoller,
        decoration: InputDecoration(
            labelText: 'email',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        keyboardType: TextInputType.emailAddress,
      );
    }

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
          if ((value.isEmpty) || isNumeric(value)) {
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
          if ((value.isEmpty) || isNumeric(value)) {
            return 'lastname is Required';
          }

          return null;
        },
      );
    }

    //code
    Widget buildid() {
      return TextFormField(
        controller: _codeConttoller,
        obscureText: true,
        enabled: false,
        decoration: InputDecoration(
            labelText: 'Code',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
      );
    }

    //Specialite
    Widget _buildprofession() {
      return TextFormField(
        controller: _specialiteConttoller,
        decoration: InputDecoration(
            labelText: 'Specialite',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if ((value.isEmpty) || isNumeric(value)) {
            return 'Specialite is Required';
          }

          return null;
        },
      );
    }

    //teldom
    Widget _buildteldom() {
      return TextFormField(
        controller: _tel3Conttoller,
        decoration: InputDecoration(
            labelText: 'tel dom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if ((value.isEmpty) || !isNumeric(value)) {
            return 'teldom is Required';
          }

          return null;
        },
      );
    }

    //tel1
    Widget _buildtel1() {
      return TextFormField(
        controller: _tel1Conttoller,
        decoration: InputDecoration(
            labelText: 'tel1 ',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
      );
    }

    //tel1
    Widget _buildtel2() {
      return TextFormField(
        controller: _tel2Conttoller,
        decoration: InputDecoration(
            labelText: 'tel2 ',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
      );
    }

    //tel3
    Widget _buildtel3() {
      return TextFormField(
        controller: _tel1Conttoller,
        decoration: InputDecoration(
            labelText: 'tel3 ',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
      );
    }

    //tel3
    Widget _buildgsm() {
      return TextFormField(
        controller: _gsmmobileConttoller,
        decoration: InputDecoration(
            labelText: 'gsm ',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if ((value.isEmpty) || !isNumeric(value)) {
            return 'gsm is Required';
          }

          return null;
        },
      );
    }

    //adresse
    Widget _buildadresse() {
      return TextFormField(
        controller: _adresseConttoller,
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
        controller: _villeConttoller,
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Modifier Profile"),
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
                    buildid(),
                    _buildnom(),
                    _buildprenom(),
                    _buildprofession(),
                    _buildteldom(),
                    _buildtel1(),
                    _buildtel2(),
                    _buildtel3(),
                    _buildgsm(),
                    _buildfax(),
                    _buildemail(),
                    _buildadresse(),
                    _buildville(),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          final login = AddLogin(
                            Code: _codeConttoller.text,
                            Adresse: _adresseConttoller.text,
                            CodeP: _codeConttoller.text,
                            Email: _emailConttoller.text,
                            Fax: _faxConttoller.text,
                            Gsm: _gsmmobileConttoller.text,
                            Nom: _nomConttoller.text,
                            Prenom: _prenomConttoller.text,
                            Specialite: _specialiteConttoller.text,
                            TelBur1: _tel1Conttoller.text,
                            TelBur2: _tel2Conttoller.text,
                            TelDom: _tel3Conttoller.text,
                            Ville: _villeConttoller.text,
                          );
                          final result =
                              await loginService.verifierlogin(login);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
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
