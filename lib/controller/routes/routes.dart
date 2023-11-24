import 'package:flutter/material.dart';

import '../../view/screen/home_screen.dart';
import '../../view/screen/login_screen.dart';
import '../../view/screen/register_screen.dart';

class Routes {
  static Route<dynamic> onGenerating(RouteSettings settings) {
    switch (settings.name) {
      case 'homeScreen':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case 'loginScreen':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case 'registerScreen':
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
