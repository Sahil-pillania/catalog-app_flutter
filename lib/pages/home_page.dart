import "package:catalog_app/modals/catalog.dart";
import "package:catalog_app/widgets/drawer.dart";
import "package:catalog_app/widgets/item_widget.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "dart:convert";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int day = 2555645;

  final String name = "Sahil";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    var json = await rootBundle.loadString("assets/files/Catalog.json");
    var decodedData = jsonDecode(json);
    var productsData = decodedData["products"];
    CatalogModel.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.products[0]);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog App"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: (CatalogModel.products != null &&
                  CatalogModel.products.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.products.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(item: CatalogModel.products[index]);
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ),
        drawer: const MyDrawer());
  }
}
