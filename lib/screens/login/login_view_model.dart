import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  late bool newUser;
  bool _obsecureText = true;

  TextEditingController get getEmail => _emailController;
  TextEditingController get getPassword => _passwordController;
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
