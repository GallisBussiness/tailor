import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor/models/clientmodel.dart';
import 'package:tailor/models/responseloginmodel.dart';
import 'package:tailor/models/usermodel.dart';
import 'package:tailor/services/constants.dart';

import 'package:http/http.dart' as http;

class UserService {
  static Future<ResponseLoginModel?> signUp(Object? data) async {
    try {
      http.Response content =
          await http.post(Uri.parse("$backUrl/user"), body: data);
      return ResponseLoginModel.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }

  static Future<User?> getUser() async {
    try {
      ResponseLoginModel u = await UserService._getStoredUser();
      http.Response content = await http.get(Uri.parse("$backUrl/user/${u.id}"),
          headers: {"Authorization": "Bearer ${u.token}"});
      return User.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }

  static Future<ResponseLoginModel?> login(Object? data) async {
    try {
      http.Response content =
          await http.post(Uri.parse("$backUrl/user/login"), body: data);
      return ResponseLoginModel.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }

  static Future<Client?> addClient(Object? data, String id) async {
    try {
      ResponseLoginModel u = await UserService._getStoredUser();
      http.Response content = await http.post(
          Uri.parse("$backUrl/client/create/$id"),
          body: data,
          headers: {"Authorization": "Bearer ${u.token}"});
      return Client.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }

  static Future<Client?> updateClient(Object? data, String id) async {
    try {
      ResponseLoginModel u = await UserService._getStoredUser();
      http.Response content = await http.patch(Uri.parse("$backUrl/client/$id"),
          body: data, headers: {"Authorization": "Bearer ${u.token}"});
      return Client.fromJson(jsonDecode(content.body));
    } catch (e) {
      return null;
    }
  }

  static Future<ResponseLoginModel> _getStoredUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ResponseLoginModel u =
        ResponseLoginModel.fromJson(jsonDecode(prefs.getString('user')!));
    return u;
  }
}
