import 'package:flutter/material.dart';

import '../../view/screen/home_screen.dart';

class Routes {
  static Route<dynamic> onGenerating(RouteSettings settings) {
    switch (settings.name) {
      case 'homeScreen':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
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
