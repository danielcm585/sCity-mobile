import 'package:flutter/material.dart';
import 'package:scity_mobile/models/auth/user_model.dart';

class AuthProvider with ChangeNotifier {
  User? _userData;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  User? get userData => _userData;

  void setUserData(User? newVal) {
    _userData = newVal;
    notifyListeners();
  }

  void setIsLoggedIn(bool newVal) {
    _isLoggedIn = newVal;
    notifyListeners();
  }
}