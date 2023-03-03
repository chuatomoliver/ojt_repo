// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      birthday: json['birthday'] as String,
      gender: json['gender'] as String,
      mobile: json['mobile'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'mobile': instance.mobile,
    };
