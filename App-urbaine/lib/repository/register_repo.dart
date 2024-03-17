import 'dart:convert';
import 'dart:developer';

import 'package:city_hygiene_app/exceptions/auth_exceptions.dart';
import 'package:city_hygiene_app/utils/environment.dart';
import 'package:http/http.dart' as http;

class RegisterRepo {
  RegisterRepo();

  Future<bool> registerUser(String name, String lastName, String email,
      String password, String phoneNumber, int city) async {
    String url = "${Environment.baseUrl}register";
    Map<String, String> headers = {
      'content-type': 'application/json',
    };

    final body = jsonEncode({
      "name": name,
      "lastname": lastName,
      "email": email,
      "password": password,
      "password_confirmation": password,
      "phonenumber": phoneNumber,
      "ville_id": city
    });

    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    log('Response body + ${response.body}');
    log('Response status code + ${response.statusCode}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw FailedToRegister();
    }
  }
}
