import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_fantasy/firebase_options.dart';
import 'package:valorant_fantasy/views/authentication_page/login_page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 1, 38, 67),
        useMaterial3: true,
        navigationBarTheme: const NavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 1, 38, 67)),
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            color: Color.fromARGB(255, 1, 38, 67),
            titleTextStyle: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: const Color.fromARGB(255, 1, 38, 67)),
      ),
    );
  }
}
