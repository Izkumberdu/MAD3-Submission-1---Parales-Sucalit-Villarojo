import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midterm_mobile_3/screens/login.dart';

class GlobalRouter {
  late GoRouter router;
  late GlobalKey<NavigatorState> _rootNavigatorKey;
  late GlobalKey<NavigatorState> _shellNavigatorKey;

  GlobalRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();
    router = GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: Login.route,
        routes: [
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Login.route,
              name: Login.name,
              builder: (context, _) {
                return const Login();
              })
        ]);
  }
}
