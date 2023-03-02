import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String firstName;
  String lastName;
  String birthday;
  String gender;
  String mobile;

  User(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.birthday,
      required this.gender,
      required this.mobile});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
