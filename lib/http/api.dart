import '../common.dart';

class Api{

  static const Base_Url = "http://82.157.176.209:8080/api/v1";
  static const send_Email = "/sendEmail/";
  static const login = "/login";
  static const register = "/register";
  static const email = "1395723441@qq.com";
//注册邮箱
  static Future<ApiBean?> sendEmail({String? baseUrl = Base_Url,}) async {
    Map<String, dynamic>? map = await DioManager().post('$baseUrl$send_Email$email',);
    if (map != null) {
      return ApiBean.fromJson(map);
    } else {
      return null;
    }
  }

//用户登录
  static Future<LoginBean?> userLogin({String? baseUrl = Base_Url,Map<String, dynamic>? params}) async {
    Map<String, dynamic>? map = await DioManager().post('$baseUrl$login',data:params, );
    if (map != null) {
      SpUtil.setString("token", map["msg"]);
      DioManager().setToken(map["msg"]);
      return LoginBean.fromJson(map["data"]);
    } else {
      return null;
    }
  }

  //用户注册
  static Future<ApiBean?> userRegister({String? baseUrl = Base_Url,Map<String, dynamic>? params}) async {
    Map<String, dynamic>? map = await DioManager().post('$baseUrl$register',data:params, );
    if (map != null) {
      return ApiBean.fromJson(map);
    } else {
      return null;
    }
  }
}
