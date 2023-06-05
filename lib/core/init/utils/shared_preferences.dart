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
  final dataToken = prefs.getString(token);
  return dataToken ?? "";
}

void removeToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove(token);
}