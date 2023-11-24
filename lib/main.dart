import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/routes/routes.dart';
import 'controller/routes/routes_name.dart';
import 'view/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: MaterialApp(
        title: 'HackaHolic Project',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(context).lightTheme(),
        themeMode: ThemeMode.system,
        initialRoute: RoutesName.homeScreen,
        onGenerateRoute: Routes.onGenerating,
      ),
    );
  }
}
