import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/user/user.dart';
part 'login.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LoginModel {
  LoginModel({
    this.token,
    this.user,
    this.message,
  });

  String? token;
  User? user;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
