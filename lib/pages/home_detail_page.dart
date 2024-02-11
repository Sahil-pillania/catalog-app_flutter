import "package:catalog_app/modals/catalog.dart";
import "package:catalog_app/widgets/home_widgets/add_to_cart.dart";
import "package:catalog_app/widgets/themes.dart";
import "package:flutter/material.dart";
import "package:velocity_x/velocity_x.dart";

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            // buttonPadding: Vx.mOnly(right: 16),
            children: [
              "\$${catalog.price}".text.bold.xl3.green400.make(),
              AddtoCart(
                catalog: catalog,
              ).wh(150, 50)
            ],
          ).pOnly(right: 8.0).p12(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                  child: VxArc(
                      height: 30.0,
                      arcType: VxArcType.convey,
                      edge: VxEdge.top,
                      child: Container(
                        color: context.cardColor,
                        width: context.screenWidth,
                        child: Column(
                          children: [
                            catalog.name.text.xl4.bold
                                .color(MyThemes.darkBlueColor)
                                .make(),
                            catalog.description.text.xl
                                .textStyle(context.captionStyle)
                                .make(),
                            12.heightBox,
                            "Et eos gubergren lorem nonumy dolore eirmod sed sed, duo invidunt ut accusam stet sit eirmod. Lorem sea lorem voluptua.Et eos gubergren lorem nonumy dolore eirmod sed sed, duo invidunt ut accusam stet sit eirmod. Lorem sea lorem voluptua.Et eos gubergren lorem nonumy dolore eirmod sed sed, duo invidunt ut accusam stet sit eirmod. Lorem sea lorem voluptua."
                                .text
                                .textStyle(context.captionStyle)
                                .make()
                                .p16()
                          ],
                        ).py64(),
                      )))
            ],
          ),
        ));
  }
}
