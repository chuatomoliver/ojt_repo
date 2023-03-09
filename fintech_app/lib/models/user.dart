class User {
  String? _id;
  String _name = '';
  String _mobile = '';
  String _token = '';

  User(
      {String? id,
      required String name,
      required String mobile,
      required String token}) {
    _id = id;
    _name = name;
    _mobile = mobile;
    _token = token;
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get mobile => _mobile;
  set mobile(String mobile) => _mobile = mobile;
  String get token => _token;
  set token(String token) => _token = token;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['mobile'] = _mobile;
    data['token'] = _token;
    return data;
  }
}
