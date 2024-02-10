import 'package:catalog_app/modals/cart.dart';
import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
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
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
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
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.theme.primaryColor).make(),
                catalog.description.text.textStyle(context.captionStyle).make(),
                8.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  // buttonPadding: Vx.mOnly(right: 16),
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    _AddtoCart(catalog: catalog)
                  ],
                )
              ]),
        )
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

class _AddtoCart extends StatefulWidget {
  const _AddtoCart({required this.catalog});

  final Item catalog;

  @override
  State<_AddtoCart> createState() => __AddtoCartState();
}

bool isAdded = false;

class __AddtoCartState extends State<_AddtoCart> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.indicatorColor)),
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        // shape: MaterialStateProperty.all(StadiumBorder()),
        child: isAdded
            ? Icon(Icons.done)
            : "Add to Cart".text.color(Vx.white).make());
  }
}
