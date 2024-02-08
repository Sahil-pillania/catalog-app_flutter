import "package:catalog_app/modals/catalog.dart";
import "package:catalog_app/widgets/themes.dart";
import "package:flutter/material.dart";
import "package:velocity_x/velocity_x.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      backgroundColor: MyThemes.creamColor,
    );
  }
}
