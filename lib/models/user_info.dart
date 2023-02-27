class RegistrationInfo {
  String? first_name;
  String? last_name;
  String? birthday;
  String? gender;
  String? mobile;

  RegistrationInfo(
      {required this.first_name,
      required this.last_name,
      required this.birthday,
      required this.gender,
      required this.mobile});

  RegistrationInfo.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    birthday = json['birthday'];
    gender = json['gender'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['mobile'] = mobile;
    return data;
  }
}
