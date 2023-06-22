// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Meta meta;
  Data? data;

  LoginModel({
    required this.meta,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  String? token;

  Data({
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class Meta {
  String message;
  int code;
  bool isError;

  Meta({
    required this.message,
    required this.code,
    required this.isError,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        message: json["message"],
        code: json["code"],
        isError: json["is_error"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "is_error": isError,
      };
}
