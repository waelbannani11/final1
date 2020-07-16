import 'package:final1/Animations/FadeAnimation.dart';
import 'package:final1/aboutus.dart';
import 'package:final1/modifierprofile.dart';
import 'package:final1/screens/login.dart';
import 'package:final1/screens/patient_screens/patient_page.dart';
import 'package:final1/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:final1/widgets/top_container.dart';
import 'consultation_page.dart';
import 'agenda.dart';
import 'create_new_rdv_page.dart';
import 'medicament_screens/medicaments_page.dart';

class HomePage extends StatefulWidget {
  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

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
  HomePage(
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
  _HomePageState createState() => _HomePageState(
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

class _HomePageState extends State<HomePage> {
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
  _HomePageState(
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
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(
                            Code: Code,
                            Prenom: Prenom,
                            Nom: Nom,
                            Adresse: Adresse,
                            Specialite: Specialite,
                            Ville: Ville,
                            CodeP: CodeP,
                            TelBur1: TelBur1,
                            TelBur2: TelBur2,
                            TelDom: TelDom,
                            Gsm: Gsm,
                            Email: Email,
                            Fax: Fax,
                          )),
                );
              },
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Dr.' + Nom + ' ' + Prenom,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  Specialite,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.people,
              ),
              title: Text('Les Patients'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Patients()),
                );
              },
            ),
            const Divider(
              thickness: 0.5,
            ),
            ListTile(
              title: Text('Les Médicaments'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Medicament()),
                );
              },
            ),
            const Divider(
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.mode_edit),
              title: Text('Modifier Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ModifierProfile(
                            Code: Code,
                            Prenom: Prenom,
                            Nom: Nom,
                            Adresse: Adresse,
                            Specialite: Specialite,
                            Ville: Ville,
                            CodeP: CodeP,
                            TelBur1: TelBur1,
                            TelBur2: TelBur2,
                            TelDom: TelDom,
                            Gsm: Gsm,
                            Email: Email,
                            Fax: Fax,
                          )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos de nous'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back_ios),
              title: Text('Deconnecter'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FadeAnimation(
              1,
              TopContainer(
                height: 130,
                width: width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 90.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.75,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: LightColors.kRed,
                              backgroundColor: Colors.blue[200],
                              center: CircleAvatar(
                                backgroundColor: Colors.blue[100],
                                radius: 35.0,
                                backgroundImage: AssetImage(
                                  'assets/images/doctor_avatar.png',
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Dr.' + Nom,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: LightColors.kDarkBlue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    Prenom,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: LightColors.kDarkBlue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    Specialite,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            FadeAnimation(
              3,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                subheading('AGENDA'),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AgendaViewCustomization()),
                                    );
                                  },
                                  child: HomePage.calendarIcon(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            subheading('MON MENU'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Patients()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(15.0),
                      height: 450,
                      width: width,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'Les patients',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Center(
                                child: Image.asset('assets/images/avatar.png',
                                    width: 100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Medicament()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(15.0),
                      height: 175,
                      width: width,
                      decoration: BoxDecoration(
                        color: LightColors.kDarkYellow,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'Les médicaments',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Center(
                                child: Image.asset('assets/images/medic.png',
                                    width: 100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Medicament()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(15.0),
                      height: 175,
                      width: width,
                      decoration: BoxDecoration(
                        color: LightColors.kDarkBlue,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'Chat',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Center(
                                child: Image.asset('assets/images/msg.png',
                                    width: 100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(15.0),
                      height: 175,
                      width: width,
                      decoration: BoxDecoration(
                        color: LightColors.kRed,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'a propos de nous',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Center(
                                child: Image.asset('assets/images/aboutus.png',
                                    width: 100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
