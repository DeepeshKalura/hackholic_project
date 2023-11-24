import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/app/dummy_controller.dart';
import 'controller/app/login_screen_controller.dart';
import 'controller/app/register_screen_controller.dart';
import 'controller/routes/routes.dart';
import 'firebase_options.dart';
import 'view/screen/home_screen.dart';
import 'view/screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _instance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DummyController>(
          create: (_) => DummyController(),
        ),
        ChangeNotifierProvider<LoginScreenController>(
          create: (_) => LoginScreenController(),
        ),
        ChangeNotifierProvider(create: (_) => RegisterScreenController()),
      ],
      child: MaterialApp(
        title: 'HackaHolic Project',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        onGenerateRoute: Routes.onGenerating,
        home: StreamBuilder(
          stream: _instance.authStateChanges(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                );
              case ConnectionState.none:
                return const Scaffold(
                  body: Center(
                    child: Text('No Internet Connection'),
                  ),
                );
              case ConnectionState.active:
                if (snapshot.hasData) {
                  return const HomeScreen();
                } else {
                  return const LoginScreen();
                }
              case ConnectionState.done:
                return const Scaffold(
                  body: Center(
                    child: Text('Done'),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
