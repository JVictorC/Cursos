import 'dart:convert';

import 'package:auth_firebase/exceptions/auth_exeptions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _email;
  String? _passWord;
  String? _idUser;
  String? _idToken;
  DateTime? _expiryDate;

  Auth([this._email, this._passWord, this._idToken, this._idUser]);

  Future<void> requestFirebse(
      String method, String email, String password) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$method?key=AIzaSyDbuZjVt2gJdavkzwoa1_q86qoy0CxOHfY';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        "email": email,
        "password": password,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(key: body['error']['message']);
    } else {
      _email = body['email'];
      _idUser = body['localId'];
      _idToken = body['idToken'];

      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            body['expiresIn'],
          ),
        ),
      );

      notifyListeners();
    }
  }

  Future<void> singIn(Map<String, String> formData) async {
    return requestFirebse(
      'signInWithPassword',
      formData['email'].toString(),
      formData['password'].toString(),
    );
  }

  Future<void> singUp(Map<String, String> formData) async {
    return requestFirebse(
      'signUp',
      formData['email'].toString(),
      formData['password'].toString(),
    );
  }

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return  isValid && _idToken != null;
  }

  String get email {
    return _email ?? '';
  }

}
