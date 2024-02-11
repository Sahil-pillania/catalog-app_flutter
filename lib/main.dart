import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/modals/cart.dart';
import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/pages/cart_page.dart';
// import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
CatalogModel catalog;
CartModel cart;
  runApp(VxState(store: MyStore(catalog, cart), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      // initialRoute: MyRoutes.loginRoute,
      routes: {
        // "/":(context)=> HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        // MyRoutes.homeDetailsRoute: (context) => HomeDetailPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        // "/":(context)=> HomePage(),
      },
    );
  }
}
