import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

String? _stringFromDynamic(dynamic value) {
  if (value == null) return null;
  return value.toString();
}

@JsonSerializable()
class LoginModel {
  @JsonKey(fromJson: _stringFromDynamic)
  String? status;
  @JsonKey(fromJson: _stringFromDynamic)
  String? message;
  LoginData? data;

  LoginModel({this.status, this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class LoginData {
  LoginUserModel? user;
  @JsonKey(name: 'access_token', fromJson: _stringFromDynamic)
  String? accessToken;
  @JsonKey(name: 'token_type', fromJson: _stringFromDynamic)
  String? tokenType;

  LoginData({this.user, this.accessToken, this.tokenType});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginUserModel {
  @JsonKey(fromJson: _stringFromDynamic)
  String? id;
  @JsonKey(fromJson: _stringFromDynamic)
  String? name;
  @JsonKey(fromJson: _stringFromDynamic)
  String? email;
  @JsonKey(name: 'email_verified_at', fromJson: _stringFromDynamic)
  String? emailVerifiedAt;
  @JsonKey(fromJson: _stringFromDynamic)
  String? avatar;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  LoginUserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserModelToJson(this);
}
