import "package:catalog_app/modals/catalog.dart";
import "package:catalog_app/widgets/themes.dart";
import "package:flutter/material.dart";
import "package:velocity_x/velocity_x.dart";

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyThemes.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            // buttonPadding: Vx.mOnly(right: 16),
            children: [
              "\$${catalog.price}".text.bold.xl3.green400.make(),
              ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyThemes.darkBlueColor)),
                      onPressed: () {
                        print("clicked");
                      },
                      // shape: MaterialStateProperty.all(StadiumBorder()),
                      child: "Buy".text.color(Vx.white).make())
                  .wh(100, 50)
            ],
          ).pOnly(right: 8.0).p12(),
        ),
        appBar: AppBar(),
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
                        color: Colors.white,
                        width: context.screenWidth,
                        child: Column(
                          children: [
                            catalog.name.text.xl4.bold
                                .color(MyThemes.darkBlueColor)
                                .make(),
                            catalog.description.text.xl
                                .textStyle(context.captionStyle)
                                .make(),
                            8.heightBox,
                          ],
                        ).py64(),
                      )))
            ],
          ),
        ));
  }
}
