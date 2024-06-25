import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:midterm_mobile_3/controllers/state.dart';

class AuthController with ChangeNotifier {
  static void initialize() {
    GetIt.instance.registerSingleton<AuthController>(AuthController());
  }

  static AuthController get instance => GetIt.instance<AuthController>();

  static AuthController get I => GetIt.instance<AuthController>();

  AuthState state = AuthState.unauthenticated;
  SimulateLogin smLogin = SimulateLogin();
  checkUser(String patientID, String password) async {
    bool isLoggedIn = await smLogin.checkUser(patientID, password);
    if (isLoggedIn) {
      state = AuthState.authenticated;
      notifyListeners();
    }
  }
}

class SimulateLogin {
  Map<String, String> users = {"Joel": "room4"};

  Future<bool> checkUser(String patientID, String password) async {
    if (users[patientID] == null) throw Exception("Patient does not exist");
    if (users[patientID] != password) throw Exception("Incorrect Password");
    return users[patientID] == password;
  }
}
