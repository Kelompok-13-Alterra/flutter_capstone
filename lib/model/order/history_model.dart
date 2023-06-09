import 'dart:convert';

HistoryModel historyModelFromJson(String str) {
  final jsonData = json.decode(str);
  return HistoryModel.fromJson(jsonData);
}

String historyModelToJson(HistoryModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class HistoryModel {
  List<History> data;
  Meta meta;

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
  int discount;
  String end;
  int officeId;
  int price;
  String start;
  bool status;
  int tax;
  int totalPrice;
  int userId;

  History({
    required this.discount,
    required this.end,
    required this.officeId,
    required this.price,
    required this.start,
    required this.status,
    required this.tax,
    required this.totalPrice,
    required this.userId,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        discount: json["discount"] ?? 0,
        end: json["end"] ?? "",
        price: json["price"] ?? 0,
        start: json["start"] ?? "",
        status: json["status"] == true ? true : false,
        tax: json["tax"] ?? 0,
        totalPrice: json["totalPrice"] ?? 0,
        userId: json["userID"] ?? 0,
        officeId: json["officeID"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "discount": discount,
        "end": end,
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
