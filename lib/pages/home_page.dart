import "dart:convert";

import "package:catalog_app/core/store.dart";
import "package:catalog_app/modals/cart.dart";
import "package:catalog_app/utils/routes.dart";
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:velocity_x/velocity_x.dart";

import "package:catalog_app/modals/catalog.dart";

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

    final _cart = (VxState.store as MyStore);

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, status) => FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                backgroundColor: context.theme.indicatorColor,
                child: Icon(CupertinoIcons.cart, color: Colors.white))
            .badge(
                color: Vx.red500,
                size: 20,
                count: 0,
                textStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      // appBar: AppBar(
      //     title: const Text("Catalog App"),
      //     ),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
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
