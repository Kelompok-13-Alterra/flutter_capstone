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
        discount: json["Discount"] ?? 0,
        end: json["End"] ?? "",
        price: json["Price"] ?? 0,
        start: json["Start"] ?? "",
        status: json["Status"] == true ? true : false,
        tax: json["Tax"] ?? 0,
        totalPrice: json["TotalPrice"] ?? 0,
        userId: json["UserID"] ?? 0,
        officeId: json["OfficeID"] ?? 0,
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

class Office {
  int capacity;
  Close close;
  String description;
  String facilities;
  String location;
  String name;
  Close open;
  int price;
  bool status;
  String type;

  Office({
    required this.capacity,
    required this.close,
    required this.description,
    required this.facilities,
    required this.location,
    required this.name,
    required this.open,
    required this.price,
    required this.status,
    required this.type,
  });

  factory Office.fromJson(Map<String, dynamic> json) => new Office(
        capacity: json["Capacity"],
        close: Close.fromJson(json["Close"]),
        description: json["Description"],
        facilities: json["Facilities"],
        location: json["Location"],
        name: json["Name"],
        open: Close.fromJson(json["Open"]),
        price: json["Price"],
        status: json["Status"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "capacity": capacity,
        "close": close,
        "description": description,
        "facilities": facilities,
        "location": location,
        "name": name,
        "open": open,
        "price": price,
        "status": status,
        "type": type,
      };
}

class Close {
  Close();

  factory Close.fromJson(Map<String, dynamic> json) => new Close();

  Map<String, dynamic> toJson() => {};
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
