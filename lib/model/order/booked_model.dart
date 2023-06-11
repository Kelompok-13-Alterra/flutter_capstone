import 'dart:convert';

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
    required this.officeId,
    required this.price,
    required this.start,
    required this.status,
    required this.tax,
    required this.totalPrice,
    required this.userId,
  });

  factory Booked.fromJson(Map<String, dynamic> json) => Booked(
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
        capacity: json["capacity"],
        close: Close.fromJson(json["close"]),
        description: json["description"],
        facilities: json["facilities"],
        location: json["location"],
        name: json["name"],
        open: Close.fromJson(json["open"]),
        price: json["price"],
        status: json["status"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "capacity": capacity,
        "close": close.toJson(),
        "description": description,
        "facilities": facilities,
        "location": location,
        "name": name,
        "open": open.toJson(),
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
