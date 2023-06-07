import 'package:flutter/material.dart';

class SignupViewModel with ChangeNotifier {
final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isChecked = false;
  late bool newUser;
  bool _obsecureText = true;

  TextEditingController get getEmail => _emailController;
  TextEditingController get getUsername => _usernameController;
  TextEditingController get getPassword => _passwordController;
  TextEditingController get getconfirmPasswordController => _confirmPasswordController;
  bool get getChecked => isChecked;
  bool get getObsecureText => _obsecureText;

  setTogglePasswordVisibility(bool value) {
    _obsecureText = value;
    notifyListeners();
  }

  set setChecked(bool value) {
    isChecked = value;
    notifyListeners();
  }
}


