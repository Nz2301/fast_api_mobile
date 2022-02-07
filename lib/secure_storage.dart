import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  String _accessKey = 'access_token';
  FlutterSecureStorage _storage = new FlutterSecureStorage();

  Future<String?> getEmail() async {
    return _storage.read(key: _accessKey);
  }
}
