import "dart:convert";

import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import "package:catalog_app/widgets/themes.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:velocity_x/velocity_x.dart";

import "package:catalog_app/modals/catalog.dart";
// import "package:catalog_app/widgets/drawer.dart";
// import "package:catalog_app/widgets/item_widget.dart";

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
      backgroundColor: MyThemes.creamColor,
      // appBar: AppBar(
      //     title: const Text("Catalog App"),
      //     ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.products != null &&
                  CatalogModel.products.isNotEmpty)
                CatalogList().py4().expand()
              else
                CircularProgressIndicator().centered().py16().expand()
            ],
          ),
        ),
      ),
    );
  }
}
