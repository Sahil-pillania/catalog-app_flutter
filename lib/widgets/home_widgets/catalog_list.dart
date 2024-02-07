import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:catalog_app/widgets/themes.dart';

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
