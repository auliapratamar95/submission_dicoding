import 'package:flutter/material.dart';
import 'package:submission_flutter_beginner/screens/auth_screen.dart';
import 'package:submission_flutter_beginner/screens/home_screen.dart';
import 'package:submission_flutter_beginner/screens/login_screen.dart';

import '../screens/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const auth = '/auth';
  static const login = '/login';
  static const main = '/main';
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.auth:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.main:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), settings: settings);
      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
