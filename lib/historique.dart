import 'dart:convert';
import 'package:final1/models/ordan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/consultation.dart';
import 'dart:ui' as ui;

class HistoriqueMed extends StatefulWidget {
  int id;
  String nom;
  String prenom;
  HistoriqueMed({this.id, this.nom, this.prenom});
  @override
  _HistoriqueMedState createState() => _HistoriqueMedState(
        id,
        nom,
        prenom,
      );
}

class _HistoriqueMedState extends State<HistoriqueMed> {
  int id;
  String nom;
  String prenom;
  _HistoriqueMedState(this.id, this.nom, this.prenom);
  List<Consultation> _list = [];
  List<Ordan> _list1 = [];
  var loading = false;
  var url = 'http://192.168.100.200:5000/Consultations';
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
          _list.add(Consultation.formJson(i));
          loading = false;
        }
      });
    }
  }

  Future<Null> fetchData1() async {
    setState(() {
      loading = true;
    });
    _list1.clear();
    var response = await http.get('http://192.168.100.200:5000/Ordonnances');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list1.add(Ordan.formJson(i));
          loading = false;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Historique")),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _list.length,
        itemBuilder: (context, i) {
          final a = _list[i];
          return Container(
            child: a.patientid == id.toString()
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                  colors: [Colors.green, Colors.blue],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 12,
                                    offset: Offset(0, 6)),
                              ]),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: CustomPaint(
                            size: Size(100, 150),
                            painter: CustomCardShapePainter(
                                30.0, Colors.green, Colors.blue),
                          ),
                        ),
                        Positioned.fill(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  "assets/images/hr.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      nom + " " + prenom,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      a.motif,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      a.subjectif,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: _list1.length,
                                          itemBuilder: (context1, j) {
                                            final b = _list1[j];
                                            return Container(
                                                child: a.consultid ==
                                                        b.consultid
                                                    ? Text(
                                                        "Ordonnance" +
                                                            ' ' +
                                                            b.SujetNormal +
                                                            ' ' +
                                                            "Indication" +
                                                            ' ' +
                                                            b.Indication,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    : SizedBox(
                                                        height: 0,
                                                      ));
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("Patient ID",
                                        style: TextStyle(color: Colors.white)),
                                    Text(id.toString(),
                                        style: TextStyle(color: Colors.white)),
                                    Text("Consult ID",
                                        style: TextStyle(color: Colors.white)),
                                    Text(a.consultid,
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
          );
        },
      ),
    );
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
