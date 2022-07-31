// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getproduct_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetProduct _$ResponseGetProductFromJson(Map<String, dynamic> json) =>
    ResponseGetProduct(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetProductToJson(ResponseGetProduct instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
