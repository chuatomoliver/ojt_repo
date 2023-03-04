import 'package:audit_finance_app/models/user_information.dart';
import 'package:dio/dio.dart';

class DioRequests {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.18.71/api/v1/index.php',
    ),
  );

  Future<int> checkUserInfo(String firstName, String lastName) async {
    try {
      final response = await dio.get(
        '/checkUserExist',
        queryParameters: {'first_name': firstName, 'last_name': lastName},
      );
      var userInfo = UserInfo.fromJson(response.data);

      if (response.statusCode == 200) {
        return userInfo.payload!.length;
      } else {
        return 0;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }

  Future<void> registerUser(Payload payload) async {
    try {
      final response = await dio.post(
        '/registration',
        data: FormData.fromMap(payload.toJson()),
      );
      var userInfo = UserInfo.fromJson(response.data);
      print(userInfo.error);
    } catch (e) {
      print(e);
    }
  }

  // PUT
  // void updateInfo({required int id, required Details details}) async {
  //   Response response;
  //   response = await dio.put('http://192.168.18.71/api/v1/index.php/updateUser',
  //       queryParameters: {'id': id},
  //       data: details.toJson(),
  //       options: Options(contentType: Headers.formUrlEncodedContentType));
  // }

  // DELETE
  // void deleteInfo({required int id}) async {
  //   Response response;
  //   response = await dio.delete(
  //     'http://192.168.18.71/api/v1/index.php/deleteUser',
  //     queryParameters: {'id': id},
  //   );
  // }
}
