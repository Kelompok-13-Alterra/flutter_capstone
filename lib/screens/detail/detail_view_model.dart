// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class DetailViewModel extends ChangeNotifier {
  int? _index;
  int get getIndex => _index!;

  setIndex(int val) {
    print(_index);
    _index = val;
    notifyListeners();
  }
}
