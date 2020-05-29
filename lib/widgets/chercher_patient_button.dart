import 'package:final1/screens/medicaments_page.dart';
import 'package:final1/screens/search.dart';
import 'package:flutter/material.dart';

class Chercherbutton extends StatelessWidget {
  const Chercherbutton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'chercherButton',
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => (Search())),
          );
        },
        child: Container(
          height: 80,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Text(
                  'chercher un patient',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                width: width - 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
