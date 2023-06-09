// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  Meta? meta;
  Data data;

  ReviewModel({
    required this.meta,
    required this.data,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int userId;
  int officeId;
  int transactionId;
  int star;
  String tags;
  String description;

  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.userId,
    required this.officeId,
    required this.transactionId,
    required this.star,
    required this.tags,
    required this.description,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        userId: json["UserID"],
        officeId: json["OfficeID"],
        transactionId: json["TransactionID"],
        star: json["Star"],
        tags: json["Tags"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "UserID": userId,
        "OfficeID": officeId,
        "TransactionID": transactionId,
        "Star": star,
        "Tags": tags,
        "Description": description,
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
