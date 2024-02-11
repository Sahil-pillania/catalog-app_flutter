import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/modals/cart.dart';
import 'package:catalog_app/modals/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
  AddtoCart({required this.catalog});

  final Item catalog;

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.indicatorColor)),
        onPressed: () {
          if (!isInCart) {
            // isInCart = isInCart.toggle();
            // final _catalog = CatalogModel();
            // final _cart = CartModel();
            // _cart.catalog = _catalog;
            // _cart.add(catalog);
            AddMutation(catalog);
            // setState(() {});
          }
        },
        // shape: MaterialStateProperty.all(StadiumBorder()),
        child: isInCart
            ? Icon(Icons.done)
            : Icon(Icons.add_shopping_cart, color: Colors.white));
  }
}
