import "dart:convert";

import "package:catalog_app/widgets/themes.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:velocity_x/velocity_x.dart";

import "package:catalog_app/modals/catalog.dart";
import "package:catalog_app/widgets/drawer.dart";
import "package:catalog_app/widgets/item_widget.dart";

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
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyThemes.darkBlueColor).make(),
        "Trending products".text.xl2.bold.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.products.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.products[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    super.key,
    required this.catalog,
  });

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(MyThemes.darkBlueColor).make(),
                catalog.description.text.textStyle(context.captionStyle).make(),
                8.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  // buttonPadding: Vx.mOnly(right: 16),
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyThemes.darkBlueColor)),
                        onPressed: () {
                          print("clicked");
                        },
                        // shape: MaterialStateProperty.all(StadiumBorder()),
                        child: "Buy".text.color(Vx.white).make())
                  ],
                ).pOnly(right: 8.0)
              ]),
        )
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p16.color(MyThemes.creamColor).make().p8().w32(context);
  }
}
