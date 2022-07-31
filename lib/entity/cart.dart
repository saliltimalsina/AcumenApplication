import 'package:floor/floor.dart';

@entity
class Cart {
  @primaryKey
  final String  id;

  final String uid;
  final String name;
  final String category;
  final String imageUrl;
  final String price;
  int quantity;

  Cart(
      {required this.id,
      required this.uid,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.quantity});
}
