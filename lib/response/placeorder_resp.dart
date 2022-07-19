import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/model/order.dart';


part 'placeorder_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class   ResponseGetOrder{
  final bool success;
  final List<Order> data;

ResponseGetOrder({
  required this.success,
  required this.data,
});
  factory ResponseGetOrder.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetOrderToJson(this);
}