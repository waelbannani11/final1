import 'package:final1/modifierprofile.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math' as math;

class Profile extends StatefulWidget {
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
  Profile(
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
  _ProfileState createState() => _ProfileState(
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

class _ProfileState extends State<Profile> {
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
  _ProfileState(
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
    TextStyle _style() {
      return TextStyle(fontWeight: FontWeight.bold);
    }

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(color: Colors.blue, boxShadow: [
                  BoxShadow(
                      color: Colors.red, blurRadius: 20, offset: Offset(0, 0))
                ]),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/doctor_avatar.png"))),
                            ),
                            Text(
                              Specialite,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              Nom,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              Prenom,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
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
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 24, 16, 20),
                          child: Transform.rotate(
                            angle: (math.pi * 0.05),
                            child: Container(
                              width: 110,
                              height: 32,
                              child: Center(
                                child: Text("Edit Profile"),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 20)
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                            ),
                            Text(
                              "   Email : ",
                              style: _style(),
                            ),
                            Text(Email),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_phone,
                            ),
                            Text(
                              "   Tel Dom : ",
                              style: _style(),
                            ),
                            Text(TelDom),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_phone,
                            ),
                            Text(
                              "   Tel Bur1 : ",
                              style: _style(),
                            ),
                            Text(TelBur1),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_phone,
                            ),
                            Text(
                              "   Tel Bur2 : ",
                              style: _style(),
                            ),
                            Text(TelBur2),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_android,
                            ),
                            Text(
                              "   Gsm : ",
                              style: _style(),
                            ),
                            Text(Gsm),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_printshop,
                            ),
                            Text(
                              "   Fax : ",
                              style: _style(),
                            ),
                            Text(Fax),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_city,
                            ),
                            Text(
                              "   Ville : ",
                              style: _style(),
                            ),
                            Text(Ville),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Icon(
                                  Icons.location_on,
                                ),
                                Text(
                                  "   Adresse : ",
                                  style: _style(),
                                ),
                                Text(Adresse),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height - 70);
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
