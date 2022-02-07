import 'package:flask_api_mobile/auth/model/user.dart';
import 'dart:convert';

import 'package:flask_api_mobile/config.dart';
import 'package:http/http.dart';

class UserApiProvide {
  Future<User> fetchUser(String first_name, String last_name, String email,
      String password) async {
    Response response;
    var url = "$BACKEND_URL/user/create_user";
    response = await post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: {
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "password": password
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw "error";
    }
  }
}
