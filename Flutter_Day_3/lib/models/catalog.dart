class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required  this.color,required this.image});
}
class CatalogModel{
static final items = [
  Item(id: "1", name: "Iphone 11", desc: "Apple Iphone 11th gen 64 GB", price: 567, color: "#33505a", image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
];
}