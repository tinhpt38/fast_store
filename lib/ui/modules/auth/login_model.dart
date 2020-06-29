import 'package:fast_store/core/model/user.dart';
import 'package:fast_store/core/services/api.dart';
import 'package:fast_store/ui/base/page_base_model.dart';
import 'package:fast_store/ui/common/share_key.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginMode extends PageModel {
  User _user;
  User get user => _user;
  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

  setLoginSuccess(bool value) {
    _isLoginSuccess = value;
    notifyListeners();
  }

  setUser(User value) {
    _user = value;
    notifyListeners();
  }

  saveLogin(String user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(ShareKey.login, user);
  }

  readLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user = sharedPreferences.getString(ShareKey.login);
    if (user != null) {
      setLoginSuccess(true);
    } else {
      setLoginSuccess(false);
    }
  }

  login(String user, String pwd) async {
    setBusy(true);
    await Api().login(user, pwd, onSuccess: (user) {
      setLoginSuccess(true);
      setUser(user);
      saveLogin(user.username);
    }, onError: (msg) {
      setLoginSuccess(false);
    });
    setBusy(false);
  }
}
