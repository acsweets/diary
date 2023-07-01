//不愿意搭理算了，臭张老师
import 'package:dio/dio.dart';
import 'token_interceptor.dart';

const int _kReceiveTimeout = 5000;
const int _kSendTimeout = 5000;
const int _kConnectTimeout = 5000;

class HttpUtil {
  TokenInterceptors? tokenInterceptors;

  static final HttpUtil _instance = HttpUtil._internal();

  Dio? _dio;

  static HttpUtil get instance => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpUtil._internal() {
    _dio ??= Dio(
      BaseOptions(
          connectTimeout:const Duration(milliseconds: _kConnectTimeout),
          sendTimeout: const Duration(milliseconds: _kSendTimeout),
          receiveTimeout: const Duration(milliseconds: _kReceiveTimeout),),
    );
    // _dio!.interceptors.add(LogsInterceptors());
    // _dio.interceptors.add(ResponseInterceptors());
  }


  Dio get client => _dio!;

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
