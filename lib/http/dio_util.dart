import 'package:dio/dio.dart';
import '../common.dart';

class DioManager{
  TokenInterceptors? tokenInterceptors;

  static final DioManager _instance = DioManager._internal();

  factory DioManager() => _instance;

  static Dio? _dio;

  DioManager._internal() {
    _dio ??= Dio(BaseOptions(
          baseUrl: Api.Base_Url, connectTimeout: const Duration(seconds: 60), receiveTimeout: const Duration(seconds: 60)));
  }

  /// Post请求
  Future<Map<String, dynamic>?> post(url,
      {Map<String, dynamic>? parameters, dynamic data, Options? options, withLoading = true}) async {
    print('postRequest:==>path:$url   params:$data');
    Response? response;
    try {
      response = await _dio!.post(url, queryParameters: parameters, data: data, options: options);
      print('postResponse==>:${response.data}');
    } on DioException catch (e) {
      print('postError:==>errorType:${e.type}   errorMsg:${e.message}');
    }
    ///response.data  请求成功是一个map最终需要将map进行转换 , 请求失败直接返回null
    ///map:转换 ,将List中的每一个条目执行 map方法参数接收的这个方法,这个方法返回T类型，
    ///map方法最终会返回一个  Iterable<T>
    return response?.data;
  }


  void setToken(String token) {
    print('---token---$token-------');
    tokenInterceptors = TokenInterceptors(token: token);
    _dio!.interceptors.add(tokenInterceptors!);
  }

  void deleteToken() {
    _dio!.interceptors.remove(tokenInterceptors);
  }

  void rebase(String baseIp) {
    _dio!.options.baseUrl = baseIp;
  }
}


const String _kTokenKey = 'Authorization';
const String _kTokenPrefix = 'Bearer ';

class TokenInterceptors<T> extends InterceptorsWrapper {
  String token;

  TokenInterceptors({this.token = ''});

  void Function()? onTokenDisabled;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (token != '') {
      bool disable = JwtDecoder.isExpired(token);
      if (disable) {
        onTokenDisabled?.call();
      }
    }
    if (token.isNotEmpty) {
      options.headers[_kTokenKey] = '$_kTokenPrefix$token';
    }
    return handler.next(options);
  }



}

