import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  final int day = 2555645;
  final String name = "Sahil";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text("Catalog App"),
        ),
        body: Container(
          child: Center(
            child: Text("Hello world $day $name"),
          ),
        ),
        drawer: const Drawer());
  }
}
