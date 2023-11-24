import 'package:flutter/material.dart';

import '../../view/screen/game_screen.dart';
import '../../view/screen/home_screen.dart';
import '../../view/screen/login_screen.dart';
import '../../view/screen/register_screen.dart';

class Routes {
  static Route<dynamic> onGenerating(RouteSettings settings) {
    switch (settings.name) {
      case 'homeScreen':
        final Map arguments = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            uid: arguments['uid'],
          ),
        );
      case 'loginScreen':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case 'registerScreen':
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case 'gameScreen':
        return MaterialPageRoute(
          builder: (_) => const GameScreen(),
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
