import 'package:flutter/material.dart';
import 'package:midterm_mobile_3/controllers/auth_controller.dart';
import 'package:midterm_mobile_3/main.dart.';
import 'package:midterm_mobile_3/routing/router.dart';
import 'package:midterm_mobile_3/screens/patient_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:midterm_mobile_3/routing/shared_preferences_helper.dart' as shared_prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Starting SharedPreferences initialization...');
  await shared_prefs.SharedPreferencesHelper.initialize();
  print('SharedPreferences initialized.');
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