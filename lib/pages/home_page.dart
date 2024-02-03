import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int day = 2555645;
  final String name = "Sahil";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog App"),
        ),
        body: Container(
          child: const Center(
            child: Text("Hello, This is Home page"),
          ),
        ),
        drawer: const Drawer());
  }
}
