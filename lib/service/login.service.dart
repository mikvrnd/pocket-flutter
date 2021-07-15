import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:pocket_app/service/constants.service.dart';

class LoginService {

  final storage = FlutterSecureStorage();

  Future<bool> login() async {
    Response res = await get(Uri.parse(api_url + '/login'));

    if (res.statusCode == 200) {
      // TODO
      storage.write(key: 'token', value: 'test');
      print(res.headers.entries);
      return true;
    }

    return false;
  }
}