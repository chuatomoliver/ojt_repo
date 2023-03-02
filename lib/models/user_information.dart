class UserInfo {
  bool? error;
  String? message;
  List<Payload>? payload;

  UserInfo({
    required this.error,
    required this.message,
    required this.payload,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(Payload.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['payload'] = payload!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Payload {
  String? firstName;
  String? lastName;
  String? birthday;
  String? gender;
  String? mobile;

  Payload(
      {required this.firstName,
      required this.lastName,
      required this.birthday,
      required this.gender,
      required this.mobile});

  Payload.fromJson(Map<String, dynamic> json) {
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
