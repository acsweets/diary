import 'package:dio/dio.dart';

import '../common.dart';

class DioManager{

  static final DioManager _instance = DioManager._internal();

  factory DioManager() => _instance;

  static Dio? _dio;

  DioManager._internal({String? baseUrl, String? cookieId, String? language}) {
    if (null == _dio) {
      _dio = Dio(BaseOptions(
          baseUrl: baseUrl!, connectTimeout: const Duration(seconds: 60), receiveTimeout: const Duration(seconds: 60)));
      _dio!.interceptors
      //  ..add(HeaderInterceptor(cookieId: cookieId, language: language))
        ..add(ErrorInterceptor());
    }
  }
}


class ErrorInterceptor extends Interceptor {
  late DateTime startTime;
  late DateTime endTime;

  String path = "";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    startTime = DateTime.now();
    path = options.path;
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    endTime = DateTime.now();
    int duration = endTime
        .difference(startTime)
        .inMilliseconds;
    Map<String, dynamic> map = {};
    map["type"] = "error";
    map["time"] = "${DateUtil.getDateStrByMs(endTime.millisecondsSinceEpoch)}";
    map["url"] = path;
    map["duration"] = duration;
    map["error"] = err.toString();
    map['errorMessage'] = err.message;
    map['errorType'] = err.type;
    map['stackTrace'] = err.stackTrace.toString();
    return handler.next(err);
  }


}