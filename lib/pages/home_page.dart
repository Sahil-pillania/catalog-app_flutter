import "package:catalog_app/modals/catalog.dart";
import "package:catalog_app/widgets/drawer.dart";
import "package:catalog_app/widgets/item_widget.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int day = 2555645;
  final String name = "Sahil";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.products[0]);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog App"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: dummyList[index]);
            },
          ),
        ),
        drawer: const MyDrawer());
  }
}
