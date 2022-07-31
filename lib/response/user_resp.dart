import 'package:my_app/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseUser {
  bool? success;
  String? msg;

  ResponseUser({this.success, this.msg});


  factory ResponseUser.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseUserToJson(this);
  // factory ResponseUser.fromJson(Map<String, dynamic> json) {
  //   return ResponseUser(
  //     msg: json['msg'],
  //     success: json['success'],
  //   );
  // }
}


@JsonSerializable(explicitToJson: true)
class LoginResp {
  bool? success;
  String? token;

  LoginResp({this.success, this.token});
  
  factory LoginResp.fromJson(Map<String, dynamic> json) =>
      _$LoginRespFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRespToJson(this);
  // factory LoginResp.fromJson(Map<String, dynamic> json) {
  //   return LoginResp(
  //     token: json['token'],
  //     success: json['success'],
  //   );
  // }
}

@JsonSerializable(explicitToJson: true)
class ResponseUserProfile {
  final bool success;

  final List<User> data;

  ResponseUserProfile({required this.success, required this.data});

   
  factory ResponseUserProfile.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseUserProfileToJson(this);
  // factory ResponseUserProfile.fromJson(Map<String, dynamic> json) {
  //   return ResponseUserProfile(success: json['success'], data: json['data']);
  // }
}
