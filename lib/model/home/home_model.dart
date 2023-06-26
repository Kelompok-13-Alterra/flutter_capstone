import 'dart:convert';
import 'dart:math';

HomeModel homeModelFromJson(String str) {
  final jsonData = json.decode(str);
  return HomeModel.fromJson(jsonData);
}

String homeModelToJson(HomeModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class HomeModel {
  List<Office> data;
  Meta meta;

  HomeModel({
    required this.data,
    required this.meta,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: (json['data'] as List).map((e) => Office.fromJson(e)).toList(),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Office {
  int id;
  double rating;
  int capacity;
  String close;
  String description;
  String facilities;
  String location;
  String name;
  String open;
  int price;
  bool status;
  String type;
  String imageUrl;

  Office({
    required this.id,
    required this.rating,
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
    required this.imageUrl,
  });

  factory Office.fromJson(Map<String, dynamic> json) => Office(
        id: json['ID'] ?? 0,
        rating: json['rating'] ?? Random().nextDouble() * (5 - 1) + 1,
        capacity: json["Capacity"] ?? 0,
        close: json["Close"] ?? DateTime.now(),
        description: json["Description"] ?? 'null',
        facilities: json["Facilities"] ?? 'null',
        location: json["Location"] ?? 'null',
        name: json["Name"] ?? 'null',
        open: json["Open"] ?? DateTime.now(),
        price: json["Price"] ?? 0,
        status: json["Status"] ?? true,
        type: json["Type"] ?? 'null',
        imageUrl: json["ImageUrl"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
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
        "imageUrl": imageUrl,
      };
}

class Close {
  Close();

  factory Close.fromJson(Map<String, dynamic> json) => Close();

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
