import 'dart:convert';

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

  factory Office.fromJson(Map<String, dynamic> json) => Office(
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

  get rating => null;

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
