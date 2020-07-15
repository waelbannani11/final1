import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    TextStyle _style() {
      return TextStyle(fontWeight: FontWeight.bold);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('a propos de nous'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "CliniSys Sarl est une Société de Service et Ingénierie en Informatique (SSII) certifié ISO 9001 :2015, crée en 1991 sous le nom de Computer Systems puis transformée en 2018 sous le nom de CliniSys sarl. "),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "CLINISYS 1èr Editeur de Logiciel de Santé en Tunisie. CliniSys est un Système d'Information de Santé intégré. Il couvre les activités des établissements de santé cliniques et hôpitaux "),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                ),
                Text(
                  "   Fax : ",
                  style: _style(),
                ),
                Text("+216 74 623 777"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                ),
                Text(
                  "   Taille de l’entreprise : ",
                  style: _style(),
                ),
                Text("152"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                ),
                Text(
                  "   Email : ",
                  style: _style(),
                ),
                Text("soft@csys.com.tn"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                ),
                Text(
                  "   Téléphone : ",
                  style: _style(),
                ),
                Text("+216 74 623 700 "),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                ),
                Text(
                  "   Adresse : ",
                  style: _style(),
                ),
                Text("Siège - Rte Menzel Chaker Km 4.5"),
              ],
            ),
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
                  Text("Siège - Rte Menzel Chaker Km 4.5"),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
