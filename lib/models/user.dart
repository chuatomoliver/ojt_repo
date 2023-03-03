import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String first_name;
  String last_name;
  String birthday;
  String gender;
  String mobile;

  User(
      {required this.first_name,
      required this.last_name,
      required this.birthday,
      required this.gender,
      required this.mobile});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
