import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:midterm_mobile_3/controllers/auth_controller.dart';
import 'package:midterm_mobile_3/controllers/state.dart';
import 'package:midterm_mobile_3/screens/login.dart';
import 'package:midterm_mobile_3/screens/patient_info.dart';

class GlobalRouter {
  static void initialize() {
    GetIt.instance.registerSingleton<GlobalRouter>(GlobalRouter());
  }

  static GlobalRouter get instance => GetIt.instance<GlobalRouter>();

  static GlobalRouter get I => GetIt.instance<GlobalRouter>();

  late GoRouter router;
  late GlobalKey<NavigatorState> _rootNavigatorKey;
  late GlobalKey<NavigatorState> _shellNavigatorKey;

  Future<String?> handleRedirect(
      BuildContext context, GoRouterState state) async {
    if (AuthController.I.state == AuthState.authenticated) {
      if (state.matchedLocation == Login.route) {
        return PatientInfoPage.route;
      }
      return null;
    }
    if (AuthController.I.state != AuthState.authenticated) {
      if (state.matchedLocation == Login.route) {
        return null;
      }
      return Login.route;
    }

    return null;
  }

  GlobalRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();
    router = GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: PatientInfoPage.route,
        redirect: handleRedirect,
        refreshListenable: AuthController.I,
        routes: [
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Login.route,
              name: Login.name,
              builder: (context, _) {
                return const Login();
              }),
          ShellRoute(
              navigatorKey: _shellNavigatorKey,
              routes: ([
                GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: PatientInfoPage.name,
                    path: PatientInfoPage.route,
                    builder: (context, _) {
                      return const PatientInfoPage();
                    }),
              ]),
              builder: (context, state, child) {
                return const PatientInfoPage();
              }),
        ]);
  }
}
