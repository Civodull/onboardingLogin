import 'dart:convert';
import 'package:city_hygiene_app/exceptions/auth_exceptions.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/auth_response.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/user_info.dart';
import 'package:city_hygiene_app/utils/environment.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class AuthRepository {
  AuthRepository();

  Future<AuthResponse> login(String email, String password) async {
    String url = "${Environment.baseUrl}login";
    Map<String, String> headers = {
      'content-type': 'application/json',
    };

    // Map<String, String> data = {
    //   'email': email,
    //   'password': password,
    // };

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    log('Response body + ${response.body}');
    log('Response status code + ${response.statusCode}');

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw NotAuthorized();
    } else if (response.statusCode == 400) {
      throw VerificationNeeded();
    } else {
      throw ServerError();
    }
  }

  Future<UserInfo> getUserInfo(String token) async {
    String url = "${Environment.baseUrl}me";

    Map<String, String> headers = {'Authorization': 'Bearer $token'};

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    log('Response body + ${response.body}');
    log('Response status code + ${response.statusCode}');

    if (response.statusCode == 200) {
      return UserInfo.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw NotAuthorized();
    } else if (response.statusCode == 400) {
      throw VerificationNeeded();
    } else {
      throw ServerError();
    }
  }
}
