// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUser _$ResponseUserFromJson(Map<String, dynamic> json) => ResponseUser(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$ResponseUserToJson(ResponseUser instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
    };

LoginResp _$LoginRespFromJson(Map<String, dynamic> json) => LoginResp(
      success: json['success'] as bool?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginRespToJson(LoginResp instance) => <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
    };

ResponseUserProfile _$ResponseUserProfileFromJson(Map<String, dynamic> json) =>
    ResponseUserProfile(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseUserProfileToJson(
        ResponseUserProfile instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
