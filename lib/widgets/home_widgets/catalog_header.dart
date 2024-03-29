import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.primaryColor).make(),
        "Trending products".text.xl2.bold.make(),
      ],
    );
  }
}
