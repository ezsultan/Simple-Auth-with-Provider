import 'dart:convert';

import 'package:ezcommerce/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserServices {
  String baseUrl = "https://shamo-backend.buildwithangga.id/api";

  Future<UserModel?> getUser({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var header = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });
    var response = await http.post(
      url,
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      await saveToken(user.token);

      return user;
    } else {
      throw Exception('Anda Gagal Register');
    }
  }

  saveToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('acces_token', token);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getString('acces_token');
    // prefs.remove('token');
    return result;
  }
}
