import 'package:final1/models/login_service.dart';
import 'package:final1/models/ordonnance_service.dart';
import 'package:final1/models/patient.dart';
import 'package:final1/models/rdv_service.dart';
import 'package:final1/screens/agenda.dart';
import 'package:final1/screens/chat_app.dart';
import 'package:final1/screens/login.dart';
import 'package:final1/screens/medicament_screens/medicamen_modify.dart';
import 'package:final1/screens/patient_screens/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:final1/screens/home_page.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'models/consultation.service.dart';
import 'models/medicament_service.dart';
import 'models/patient_service.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => PatientService());
  GetIt.I.registerLazySingleton(() => MedicamentService());
  GetIt.I.registerLazySingleton(() => ConsultationService());
  GetIt.I.registerLazySingleton(() => LoginService());
  GetIt.I.registerLazySingleton(() => OrdonnanceService());
  GetIt.I.registerLazySingleton(() => RDVSERVICE());
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightGreen, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));
  setupLocator();
  runApp(MyApp());
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
            fontFamily: 'Poppins'),
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
