// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/modals/cart.dart';
import 'package:catalog_app/modals/catalog.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  MyStore(
    this.catalog,
    this.cart,
  ) {
    catalog ??= CatalogModel();
    cart ??= CartModel();
    cart.catalog = catalog;
  }
}
