import 'package:flutter/material.dart';
import 'package:midterm_mobile_3/controllers/auth_controller.dart';
import 'package:midterm_mobile_3/routing/router.dart';
import 'package:midterm_mobile_3/screens/patient_info.dart';

void main() {
  AuthController.initialize();
  GlobalRouter.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GlobalRouter.I.router,
      debugShowCheckedModeBanner: false,
      title: "PatientLink",
    );
    // return MaterialApp(
    //   home: PatientInfoPage(),
    // );
  }
}
