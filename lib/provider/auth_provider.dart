import 'package:ezcommerce/model/user_model.dart';
import 'package:ezcommerce/service/auth_services.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  UserModel? token = UserModel();
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  Future<bool?> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel? user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool?> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel? user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
