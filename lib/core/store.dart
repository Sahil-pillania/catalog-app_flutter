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
    catalog = CatalogModel();
    cart =  CartModel();
    cart.catalog = catalog;
  
  }



  MyStore copyWith({
    CatalogModel? catalog,
    CartModel? cart,
  }) {
    return MyStore(
      catalog ?? this.catalog,
      cart ?? this.cart,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'catalog': catalog.toMap(),
  //     'cart': cart.toMap(),
  //   };
  // }

  // factory MyStore.fromMap(Map<String, dynamic> map) {
  //   return MyStore(
  //     CatalogModel.fromMap(map['catalog'] as Map<String,dynamic>),
  //     CartModel.fromMap(map['cart'] as Map<String,dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory MyStore.fromJson(String source) => MyStore.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MyStore(catalog: $catalog, cart: $cart)';

  @override
  bool operator ==(covariant MyStore other) {
    if (identical(this, other)) return true;
  
    return 
      other.catalog == catalog &&
      other.cart == cart;
  }

  @override
  int get hashCode => catalog.hashCode ^ cart.hashCode;
}
