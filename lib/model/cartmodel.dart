import 'package:json_annotation/json_annotation.dart';
part 'cartmodel.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: "_id")
  final String id;

  final String name;

  final String imageUrl;
  final int price;
  int quantity;

  CartModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.quantity});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}


