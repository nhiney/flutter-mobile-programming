import 'package:flutter/material.dart';
import '../../models/auth/user_account.dart';
import '../../database/db_helper.dart';

class AuthProvider extends ChangeNotifier {
  UserAccount? _currentUser;
  bool _isLoading = false;

  UserAccount? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  Future<bool> register(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      final user = UserAccount(email: email, password: password);
      await DatabaseHelper().insertUser(user);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    final user = await DatabaseHelper().getUser(email, password);
    if (user != null) {
      _currentUser = user;
      _isLoading = false;
      notifyListeners();
      return true;
    }
    _isLoading = false;
    notifyListeners();
    return false;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
