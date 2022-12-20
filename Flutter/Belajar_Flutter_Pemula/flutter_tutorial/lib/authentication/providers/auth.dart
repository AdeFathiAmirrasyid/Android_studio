import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProviders with ChangeNotifier {
  Timer? _authTimer;
  String? _idToken, userId;
  DateTime? _expiryDate;

  String? _tempIdToken, tempUserId;
  DateTime? _tempExpiryDate;

  Future<void> tempData() async {
    _idToken = _tempIdToken;
    userId = tempUserId;
    _expiryDate = _tempExpiryDate;
    final sharedPref = await SharedPreferences.getInstance();
    final myMapSPref = json.encode({
      "token": _tempIdToken,
      "uid": tempUserId,
      "expired": _tempExpiryDate!.toIso8601String(),
    });
    sharedPref.setString('authData', myMapSPref);
    _autoLogout();
    notifyListeners();
  }

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_idToken != null &&
        _expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now())) {
      return _idToken;
    } else {
      return null;
    }
  }

  Future<void> signup(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyATymOhNCJ45W5tXDDq-mok66JnprnRzjM");

    try {
      var response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _tempIdToken = responseData["idToken"];
      tempUserId = responseData["localId"];
      _tempExpiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData["expiresIn"])));
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyATymOhNCJ45W5tXDDq-mok66JnprnRzjM");
    try {
      var response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));

      var responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _tempIdToken = responseData["idToken"];
      tempUserId = responseData["localId"];
      _tempExpiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData["expiresIn"])));
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout() async{
    _idToken = null;
    userId = null;
    _expiryDate = null;

    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _tempExpiryDate?.difference(DateTime.now()).inSeconds;
    print(timeToExpiry);
    _authTimer = Timer(Duration(seconds: timeToExpiry!), logout);
  }

  Future<bool> autoLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('authData')) {
      return false;
    }
    final myData = json.decode(pref.get('authData').toString()) as Map<String, dynamic>;
    final myExpiryDate = DateTime.parse(myData["expired"]);
    if (myExpiryDate.isBefore(DateTime.now())) {
      return false;
    }

    _idToken = myData["token"];
    userId = myData["uid"];
    _tempExpiryDate = myData["expired"];
    notifyListeners();
    return true;
  }
}
