import 'package:flutter/material.dart';
import 'package:midterm_mobile_3/routing/router.dart';
import 'package:midterm_mobile_3/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GlobalRouter().router,
      debugShowCheckedModeBanner: false,
      title: "PatientLink",
    );
  }
}
