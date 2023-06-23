// To parse this JSON data, do
//
//     final markAsReadModel = markAsReadModelFromJson(jsonString);

import 'dart:convert';

MarkAsReadModel markAsReadModelFromJson(String str) =>
    MarkAsReadModel.fromJson(json.decode(str));

String markAsReadModelToJson(MarkAsReadModel data) =>
    json.encode(data.toJson());

class MarkAsReadModel {
  Meta? meta;
  dynamic data;

  MarkAsReadModel({
    this.meta,
    this.data,
  });

  factory MarkAsReadModel.fromJson(Map<String, dynamic> json) =>
      MarkAsReadModel(
        meta: Meta.fromJson(json["meta"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data,
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
