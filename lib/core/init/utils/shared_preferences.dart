import 'package:shared_preferences/shared_preferences.dart';

const String token = "token";
const String photoProfile = "photo";
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

savePhotoProfile({
  required String valuePhotoProfile,
}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString(photoProfile, valuePhotoProfile);
}

Future<String> getPhotoProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final dataPhotoProfile = prefs.getString(photoProfile).toString();
  return dataPhotoProfile;
}

removePhotoProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove(photoProfile);
}
