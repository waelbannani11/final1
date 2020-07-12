import 'package:final1/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AboutUs extends StatefulWidget {
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
  AboutUs(
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
  _AboutUsState createState() => _AboutUsState(
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

class _AboutUsState extends State<AboutUs> {
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
  _AboutUsState(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("À propos de nous"),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
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
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text('Dr.' + ' ' + Nom + ' ' + Prenom),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Column(
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
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(Prenom),
                            Text(Prenom),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
