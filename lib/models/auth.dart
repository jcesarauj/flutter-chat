enum AuthMode { Login, SignUp }

class AuthData {
  String name;
  String email;
  String passWord;
  AuthMode _mode = AuthMode.Login;

  bool get isSignUp {
    return _mode == AuthMode.SignUp;
  }

  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  void toogleMode() {
    _mode = _mode == AuthMode.Login ? AuthMode.SignUp : AuthMode.Login;
  }
}
