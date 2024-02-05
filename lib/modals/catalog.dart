class CatalogModel {
  static final products = [
    Item(
        id: 1,
        name: "iphone 12 pros",
        description: "Description",
        price: 799,
        color: "#33505a",
        image:
            "https://th.bing.com/th/id/OIP.LphjdCa1QEpE1tchP1owlQHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.5&pid=1.7")
  ];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}
