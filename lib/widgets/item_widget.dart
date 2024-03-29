import "package:catalog_app/modals/catalog.dart";
import "package:flutter/material.dart";

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\$${item.price}",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: Color.fromARGB(255, 121, 248, 200)),
        ),
      ),
    );
  }
}
