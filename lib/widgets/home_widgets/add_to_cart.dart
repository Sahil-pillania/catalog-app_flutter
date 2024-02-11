import 'package:catalog_app/modals/cart.dart';
import 'package:catalog_app/modals/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatefulWidget {
  const AddtoCart({required this.catalog});

  final Item catalog;

  @override
  State<AddtoCart> createState() => __AddtoCartState();
}

final _cart = CartModel();

class __AddtoCartState extends State<AddtoCart> {
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.indicatorColor)),
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();
            final _cart = CartModel();
            _cart.catalog = _catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        // shape: MaterialStateProperty.all(StadiumBorder()),
        child: isInCart ? Icon(Icons.done) : Icon(Icons.add_shopping_cart));
  }
}
