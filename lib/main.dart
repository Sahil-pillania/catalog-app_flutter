import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        // brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        // "/":(context)=> HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        // "/":(context)=> HomePage(),
      },
    );
  }
}
