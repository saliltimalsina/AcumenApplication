import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  late final String? username;
  final String? email;
  final String? password;
  final bool? isAdmin;

  User({this.username, this.email, this.password,this.isAdmin});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
