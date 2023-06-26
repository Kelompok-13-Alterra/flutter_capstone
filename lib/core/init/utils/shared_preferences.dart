import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String token = "token";

saveToken({
  required String valueToken,
}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString(token, valueToken);
}

Future<String> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final dataToken = prefs.getString(token).toString();
  return dataToken;
}

removeToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove(token);
}

class Utility {
  static const String photoProfile = "photo";

  static Future<String> getImageFromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(photoProfile).toString();
  }

  static Future<bool> saveImageToPreferences(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(photoProfile, value);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
