import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/app/dummy_controller.dart';
import 'controller/routes/routes.dart';
import 'controller/routes/routes_name.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DummyController>(
          create: (_) => DummyController(),
        ),
      ],
      child: const MaterialApp(
        title: 'HackaHolic Project',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        initialRoute: RoutesName.homeScreen,
        onGenerateRoute: Routes.onGenerating,
      ),
    );
  }
}
