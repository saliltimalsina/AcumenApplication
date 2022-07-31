import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/model/products.dart';
part 'getproduct_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetProduct {
  final bool success;

  final List<Product> data;

  ResponseGetProduct({
    required this.success,
    required this.data,
  });
  
  factory ResponseGetProduct.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetProductFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetProductToJson(this);
}
