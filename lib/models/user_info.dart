import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegistrationInfo {
  String? firstName;
  String? lastName;
  String? birthday;
  String? gender;
  String? mobile;

  RegistrationInfo(
      {required this.firstName,
      required this.lastName,
      required this.birthday,
      required this.gender,
      required this.mobile});

  RegistrationInfo.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthday = json['birthday'];
    gender = json['gender'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['mobile'] = mobile;
    return data;
  }
}
