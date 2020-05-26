import 'package:final1/screens/chercher_ajouter.dart';
import 'package:final1/screens/search.dart';
import 'package:final1/widgets/Chercher_patient_button.dart';
import 'package:flutter/material.dart';
import 'package:final1/screens/home_page.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:flutter/services.dart';
import 'widgets/top_container.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightGreen, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: LightColors.kDarkBlue,
              displayColor: LightColors.kDarkBlue,
              fontFamily: 'Poppins'
            ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
