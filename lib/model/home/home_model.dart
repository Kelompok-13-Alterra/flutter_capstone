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
  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String name;
  String description;
  int capacity;
  String type;
  String open;
  String close;
  int price;
  String location;
  String facilities;

  Office({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.description,
    required this.capacity,
    required this.type,
    required this.open,
    required this.close,
    required this.price,
    required this.location,
    required this.facilities,
  });

  factory Office.fromJson(Map<String, dynamic> json) => Office(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        name: json["Name"] ?? '',
        description: json["Description"] ?? '',
        capacity: json["Capacity"] ?? '',
        type: json["Type"] ?? '',
        open: json["Open"] ?? DateTime.now(),
        close: json["Close"] ?? DateTime.now(),
        price: json["Price"] ?? 0,
        location: json["Location"] ?? '',
        facilities: json["Facilities"] ?? '',
      );

  get rating => null;

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "Name": name,
        "Description": description,
        "Capacity": capacity,
        "Type": type,
        "Open": open,
        "Close": close,
        "Price": price,
        "Location": location,
        "Facilities": facilities,
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
