import 'package:final1/historique.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slimy_card/slimy_card.dart';

import '../consultation_page.dart';
import 'create_new_patient.dart';

class PatientInfo extends StatefulWidget {
  int id;
  String nom;
  String prenom;
  String sex;
  DateTime birthday;
  String profession;
  String nationnalite;
  int statusmatriomo_id;
  String rue;
  String ville;
  String tel_mobile;
  PatientInfo(
      {this.id,
      this.nom,
      this.prenom,
      this.sex,
      this.statusmatriomo_id,
      this.birthday,
      this.profession,
      this.nationnalite,
      this.rue,
      this.ville,
      this.tel_mobile});
  @override
  _PatientInfoState createState() => _PatientInfoState(
      id,
      nom,
      prenom,
      sex,
      statusmatriomo_id,
      birthday,
      profession,
      nationnalite,
      rue,
      ville,
      tel_mobile);
}

class _PatientInfoState extends State<PatientInfo> {
  int id;
  String nom;
  String prenom;
  String sex;
  DateTime birthday;
  String profession;
  String nationnalite;
  int statusmatriomo_id;
  String rue;
  String ville;
  String tel_mobile;
  _PatientInfoState(
      this.id,
      this.nom,
      this.prenom,
      this.sex,
      this.statusmatriomo_id,
      this.birthday,
      this.profession,
      this.nationnalite,
      this.rue,
      this.ville,
      this.tel_mobile);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informations"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Createnvpatient()),
          );
        },
        child: Icon(Icons.add),
        elevation: 20.0,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Consultation(
                            id: id,
                            nom: nom,
                            prenom: prenom,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 230, 10),
                child: Text(
                  "Consultation",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HistoriqueMed(
                            id: id,
                            nom: nom,
                            prenom: prenom,
                          )),
                );
              },
              child: Text(
                "Historique ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        color: Colors.blue,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            SlimyCard(
              slimeEnabled: false,
              color: Colors.blue,
              topCardWidget: topCardWidget(),
              bottomCardWidget: bottomCardWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget topCardWidget() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: sex == 'H'
                  ? Image.asset('assets/images/avatar_malade_boy.png',
                      width: 150, height: 150)
                  : Image.asset('assets/images/avatar_malade_girl.png',
                      width: 150, height: 150)),
          SizedBox(height: 10),
          Text(
            nom,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(height: 10),
          Text(
            prenom,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          Text(
            id.toString(),
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          SizedBox(height: 10),
        ]);
  }

  Widget bottomCardWidget() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 15.0,
                ),
              ),
              Text(
                "15/08/1995",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.work,
                  color: Colors.white,
                  size: 15.0,
                ),
              ),
              Text(
                profession,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Text(
                  ville,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Text(
                rue,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.phone_iphone,
                  color: Colors.white,
                  size: 15.0,
                ),
              ),
              Text(
                tel_mobile,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.person_pin,
                  color: Colors.white,
                  size: 15.0,
                ),
              ),
              _buildstatusmatriomo()
            ],
          ),
        ]);
  }

  Widget _buildstatusmatriomo() {
    if (statusmatriomo_id == 1) {
      return Text(
        "Célibataire",
        style: TextStyle(color: Colors.white, fontSize: 15),
      );
    } else if (statusmatriomo_id == 2) {
      return Text(
        "Marié(e)",
        style: TextStyle(color: Colors.white, fontSize: 15),
      );
    } else if (statusmatriomo_id == 3) {
      return Text(
        "Divorcé(e)",
        style: TextStyle(color: Colors.white, fontSize: 15),
      );
    }
  }
}
