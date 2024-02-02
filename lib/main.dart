import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        // brightness: Brightness.dark,
      ),
      routes: {
        // "/":(context)=> HomePage(),
        "/home": (context) => HomePage(),
        // "/":(context)=> HomePage(),
      },
    );
  }
}
