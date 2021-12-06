// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';

import 'package:auth_firebase/exceptions/auth_exeptions.dart';
import 'package:auth_firebase/store/store.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _email;
  String? _idUser;
  String? _idToken;
  DateTime? _expiryDate;
  Timer? _autoLogout;

  Auth([this._email, this._idToken, this._idUser]);

  Future<void> trySingIn() async {
    if (isAuth) return;

    final dataLoginInStore = await Store.getMap('dataLogin');
    if (dataLoginInStore.isEmpty) return;

    final validToken = DateTime.parse(dataLoginInStore['_expiryDate'])
        .isBefore(DateTime.now());

    if (validToken) return;

    _email = dataLoginInStore['_email'];
    _expiryDate = DateTime.parse(dataLoginInStore['_expiryDate']);
    _idToken = dataLoginInStore['_idToken'];
    _idUser = dataLoginInStore['_idUser'];

    autoLogout();
    notifyListeners();
  }

  Future<void> requestFirebse(
    String method,
    String email,
    String password,
  ) async {
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

      Store.setMap(
        'dataLogin',
        {
          "_email": body['email'],
          "_idUser": body['localId'],
          "_idToken": body['idToken'],
          "_expiryDate": _expiryDate!.toIso8601String(),
        },
      );

      autoLogout();
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
    return isValid && _idToken != null;
  }

  String get email {
    return _email ?? '';
  }

  void logout() {
    _idToken = null;
    _email = null;
    _idUser = null;
    _expiryDate = null;
    _autoLogout = null;

    Store.removeMap('dataLogin');

    clearTimer();
    notifyListeners();
  }

  void clearTimer() {
    _autoLogout?.cancel();
    _autoLogout = null;
  }

  void autoLogout() {
    clearTimer();
    final timer = _expiryDate?.difference(DateTime.now()).inSeconds ?? 0;
    _autoLogout = Timer(Duration(seconds: timer), logout);
  }
}
