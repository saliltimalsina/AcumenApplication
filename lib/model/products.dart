import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'products.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  int? price;
  String? description;
  String? category;
  @JsonKey(name: "image")
  String? imageUrl;
  double? rating;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.imageUrl,
      this.category,
      this.rating});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
