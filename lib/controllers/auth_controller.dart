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

  Future<void> checkUser(String patientID, String password) async {
    try {
      bool isLoggedIn = await smLogin.checkUser(patientID, password);
      if (isLoggedIn) {
        state = AuthState.authenticated;
      } else {
        state = AuthState.unauthenticated;
      }
      notifyListeners();
    } catch (e) {
      state = AuthState.unauthenticated;
      notifyListeners();
      throw e;
    }
  }
}

class SimulateLogin {
  Map<String, String> users = {"Joel": "room4"};

  Future<bool> checkUser(String patientID, String password) async {
    await Future.delayed(Duration(seconds: 1)); 
    if (users[patientID] == null) throw Exception("Patient does not exist");
    if (users[patientID] != password) throw Exception("Incorrect Password");
    return users[patientID] == password;
  }
}
