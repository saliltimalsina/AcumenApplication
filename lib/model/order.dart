import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/model/cartmodel.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  double  orderAmount;
  List<CartModel> orderItems = List.empty(growable: true);

  Order({
    required this.orderAmount,
    required this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
