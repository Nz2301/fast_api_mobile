import 'dart:ffi';

import 'package:flask_api_mobile/auth/model/user.dart';
import 'package:flask_api_mobile/auth/repository/user_api_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  String _accessKey = 'access_token';

  FlutterSecureStorage _storage = new FlutterSecureStorage();
  UserApiProvide _provider = new UserApiProvide();

  Future<String?> saveUser(String first_name, String last_name, String email,
      String password) async {
    final object =
        await _provider.fetchUser(first_name, last_name, email, password);
    String e_mail = object.email.toString();
    _storage.write(key: _accessKey, value: e_mail);

    return e_mail;
  }

  Future<String?> getEmail() async {
    return _storage.read(key: _accessKey);
  }

  Future<void> deleteEmail() async {
    return _storage.delete(key: _accessKey);
  }
}
