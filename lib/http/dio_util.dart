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
        ..add(HeaderInterceptor(cookieId: cookieId, language: language))
        ..add(ErrorInterceptor());
    }
  }
}
class HeaderInterceptor extends InterceptorsWrapper {
  String? cookieId;
  String? language;

  HeaderInterceptor({this.cookieId, this.language = "zh"});

  @override
  onRequest(RequestOptions options, handler) async {
    // options.headers[Keys.COOKIE_ID] = Context().cookieId;
    // options.headers[Keys.DEVICE] = EnumToString.parse(Platform.isIOS ? Device.IOS : Device.Android);
    // options.headers[Keys.CONTENT_TYPE] = "application/json; charset=utf-8";
    // options.headers[Keys.APP_TYPE] = Config().headerAppType;
    // options.headers[Keys.APP_VERSION] = Context().version;
    // options.headers[Keys.OS_VERSION] = Context().osVersion;
    // options.headers[Keys.DEVICE_ID] = Context().deviceId;
    // options.headers[Keys.LANGUAGE] = language ?? 'zh';
    // options.headers[Keys.COMPANY] = Config().companyId;
    // options.headers[Keys.TIME_ZONE] = 'Asia/Shanghai';
    return handler.next(options);
  }
}

class ErrorInterceptor extends Interceptor {
  late DateTime startTime;
  late DateTime endTime;

  String path = "";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    //继续调用下一个请求拦截器
    startTime = DateTime.now();
    path = options.path;
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //继续调用下个响应拦截器
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
    //继续调用下一个错误拦截器
    return handler.next(err);
  }
}