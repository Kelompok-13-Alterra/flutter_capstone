import 'dart:convert';

import 'package:flutter_capstone/model/home/home_model.dart';

BookedModel bookedModelFromJson(String str) {
  final jsonData = json.decode(str);
  return BookedModel.fromJson(jsonData);
}

String bookedModelToJson(BookedModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class BookedModel {
  List<Booked> data;
  Meta meta;

  BookedModel({
    required this.data,
    required this.meta,
  });

  factory BookedModel.fromJson(Map<String, dynamic> json) => BookedModel(
        data: (json['data'] as List).map((e) => Booked.fromJson(e)).toList(),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Booked {
  int discount;
  String end;
  Office office;
  int officeId;
  int price;
  String start;
  bool status;
  int tax;
  int totalPrice;
  int userId;

  Booked({
    required this.discount,
    required this.end,
    required this.office,
    required this.officeId,
    required this.price,
    required this.start,
    required this.status,
    required this.tax,
    required this.totalPrice,
    required this.userId,
  });

  factory Booked.fromJson(Map<String, dynamic> json) => Booked(
        discount: json["Discount"] ?? 0,
        end: json["End"] ?? "",
        office: Office.fromJson(json["Office"]),
        officeId: json["OfficeID"] ?? 0,
        price: json["Price"] ?? 0,
        start: json["Start"] ?? "",
        status: json["Status"] == true ? true : false,
        tax: json["Tax"] ?? 0,
        totalPrice: json["TotalPrice"] ?? 0,
        userId: json["UserID"] ?? 0,
      );
  Map<String, dynamic> toJson() => {
        "discount": discount,
        "end": end,
        "office": office.toJson(),
        "officeID": officeId,
        "price": price,
        "start": start,
        "status": status,
        "tax": tax,
        "totalPrice": totalPrice,
        "userID": userId,
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
