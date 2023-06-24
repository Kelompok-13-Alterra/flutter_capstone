import 'dart:convert';
import 'package:flutter_capstone/model/home/home_model.dart';

HistoryModel historyModelFromJson(String str) {
  final jsonData = json.decode(str);
  return HistoryModel.fromJson(jsonData);
}

String historyModelToJson(HistoryModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class HistoryModel {
  Meta meta;
  List<History> data;

  HistoryModel({
    required this.data,
    required this.meta,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        data: (json['data'] as List).map((e) => History.fromJson(e)).toList(),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class History {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int userId;
  int officeId;
  int discount;
  int price;
  int tax;
  int totalPrice;
  DateTime start;
  DateTime end;
  bool status;
  Office office;

  History({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.userId,
    required this.officeId,
    required this.discount,
    required this.price,
    required this.tax,
    required this.totalPrice,
    required this.start,
    required this.end,
    required this.status,
    required this.office,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        userId: json["UserID"],
        officeId: json["OfficeID"],
        discount: json["Discount"],
        price: json["Price"],
        tax: json["Tax"],
        totalPrice: json["TotalPrice"],
        start: DateTime.parse(json["Start"]),
        end: DateTime.parse(json["End"]),
        status: json["Status"],
        office: Office.fromJson(json["Office"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "UserID": userId,
        "OfficeID": officeId,
        "Discount": discount,
        "Price": price,
        "Tax": tax,
        "TotalPrice": totalPrice,
        "Start": start.toIso8601String(),
        "End": end.toIso8601String(),
        "Status": status,
        "Office": office.toJson(),
      };
}

class Meta {
  int code;
  bool isError;
  String message;

  Meta({
    required this.code,
    required this.isError,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        isError: json["is_error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "is_error": isError,
        "message": message,
      };
}
