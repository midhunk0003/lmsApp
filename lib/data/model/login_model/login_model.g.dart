// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
  status: _stringFromDynamic(json['status']),
  message: _stringFromDynamic(json['message']),
  data:
      json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  user:
      json['user'] == null
          ? null
          : LoginUserModel.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: _stringFromDynamic(json['access_token']),
  tokenType: _stringFromDynamic(json['token_type']),
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'user': instance.user,
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
};

LoginUserModel _$LoginUserModelFromJson(Map<String, dynamic> json) =>
    LoginUserModel(
      id: _stringFromDynamic(json['id']),
      name: _stringFromDynamic(json['name']),
      email: _stringFromDynamic(json['email']),
      emailVerifiedAt: _stringFromDynamic(json['email_verified_at']),
      avatar: _stringFromDynamic(json['avatar']),
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LoginUserModelToJson(LoginUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'avatar': instance.avatar,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
