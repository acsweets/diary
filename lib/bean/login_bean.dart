class LoginBean {
  int? userId;
  String? userName;
  String? userAvatar;
  String? email;
  String? roles;
  String? createAt;
  String? updateAt;
  int? activeCode;

  LoginBean({
    this.userName,
    this.userId,
    this.activeCode,
    this.createAt,
    this.email,
    this.roles,
    this.updateAt,
    this.userAvatar,
  });

  static LoginBean fromJson(Map<String, dynamic> map) {
    LoginBean loginBean = LoginBean();
    loginBean.userName = map["userName"];
    loginBean.userId = map["userId"];
    loginBean.email = map["email"];
    loginBean.userAvatar = map["userAvatar"];
    return loginBean;
  }
}
