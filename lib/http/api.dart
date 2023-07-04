import '../common.dart';

class Api{

  static const Base_Url = "http://82.157.176.209:8080/api/v1";
  static const send_Email = "/sendEmail/";
  static const Login = "/login";
  static const Register = "/register";
  static const email = "1395723441@qq.com";

  static Future<ApiBean?> sendEmail({String? baseUrl = Base_Url,}) async {
    Map<String, dynamic>? map = await DioManager().post('$baseUrl$send_Email$email',);
    if (map != null) {
      return ApiBean.fromJson(map);
    } else {
      return null;
    }
  }
}
