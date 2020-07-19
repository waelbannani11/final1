import 'dart:convert';

import 'package:final1/Animations/FadeAnimation.dart';
import 'package:final1/models/addlogin.dart';
import 'package:final1/models/login_model.dart';
import 'package:final1/models/login_service.dart';
import 'package:final1/ordonnance.dart';
import 'package:final1/screens/home_page.dart';
import 'package:final1/screens/login_patient.dart';
import 'package:final1/screens/medicament_screens/medicaments_page.dart';
import 'package:final1/screens/patient_screens/patient_info.dart';
import 'package:final1/screens/patient_screens/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final1/widgets/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginService get loginService => GetIt.I<LoginService>();
  TextEditingController _coderConttoller = TextEditingController();
  TextEditingController _usernameConttoller = TextEditingController();

  List<Loginn> _list = [];
  var loading = false;
  var url = 'http://192.168.100.134:5000/Logins';
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Loginn.formJson(i));
          loading = false;
        }
      });
    }
  }

  bool _rememberMe = false;
  bool passwordVisible;
  @override
  void initState() {
    passwordVisible = true;
    fetchData();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                SizedBox(),
                FadeAnimation(
                  1,
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 100.0,
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 300.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FadeAnimation(
                          2,
                          _buildEmailTF(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FadeAnimation(
                          3,
                          _buildPasswordTF(),
                        ),
                        FadeAnimation(
                          4,
                          _buildLoginBtn(),
                        ),
                        FadeAnimation(5, _patient())
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _usernameConttoller,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _coderConttoller,
            obscureText: passwordVisible,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _patient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginP(),
              ),
            );
          },
          child: Text(
            'se connecter en tant que patient',
            style: kLabelStyle,
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          @override
          void initState() {
            fetchData();
          }

          var i = 0;
          while (i <= _list.length) {
            if ((_list[i].Code == _coderConttoller.text) &
                (_list[i].Prenom == _usernameConttoller.text)) {
              String C = _list[i].Code;
              String P = _list[i].Prenom;
              String N = _list[i].Nom;
              String A = _list[i].Adresse;
              String CO = _list[i].CodeP;
              String T1 = _list[i].TelBur1;
              String T2 = _list[i].TelBur2;
              String T3 = _list[i].TelDom;
              String E = _list[i].Email;
              String F = _list[i].Fax;
              String G = _list[i].Gsm;
              String V = _list[i].Ville;
              String S = _list[i].Specialite;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    Code: C,
                    Prenom: P,
                    Nom: N,
                    Adresse: A,
                    CodeP: CO,
                    TelBur1: T1,
                    TelBur2: T2,
                    TelDom: T3,
                    Email: E,
                    Fax: F,
                    Gsm: G,
                    Ville: V,
                    Specialite: S,
                  ),
                ),
              );
            }
            i++;
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
