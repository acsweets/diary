class ApiBean {
  bool? status;
  String? msg;
  dynamic data;

  ApiBean({this.data, this.status, this.msg});

  static ApiBean fromJson(Map<String, dynamic> map) {
    ApiBean api = ApiBean();
    api.msg = map["msg"];
    api.status = map["status"];
    api.data = map["data"];
    return api;
  }
}
