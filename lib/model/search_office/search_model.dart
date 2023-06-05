// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  Meta? meta;
  List<Datum> data;

  SearchModel({
    this.meta,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String name;
  String description;
  int capacity;
  String type;
  String open;
  String close;
  int price;
  String location;
  String facilities;
  bool status;

  Datum({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
    required this.description,
    required this.capacity,
    required this.type,
    required this.open,
    required this.close,
    required this.price,
    required this.location,
    required this.facilities,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        name: json["Name"],
        description: json["Description"],
        capacity: json["Capacity"],
        type: json["Type"],
        open: json["Open"],
        close: json["Close"],
        price: json["Price"],
        location: json["Location"],
        facilities: json["Facilities"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
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
        "Status": status,
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


// // To parse this JSON data, do
// //
// //     final searchModel = searchModelFromJson(jsonString);

// import 'dart:convert';

// SearchModel searchModelFromJson(String str) =>
//     SearchModel.fromJson(json.decode(str));

// String searchModelToJson(SearchModel data) => json.encode(data.toJson());

// class SearchModel {
//   List<Datum> data;
//   Meta? meta;

//   SearchModel({
//     required this.data,
//     this.meta,
//   });

//   factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "meta": meta?.toJson(),
//       };
// }

// class Datum {
//   int capacity;
//   Close close;
//   String description;
//   String facilities;
//   String location;
//   String name;
//   Close open;
//   int price;
//   bool status;
//   String type;

//   Datum({
//     required this.capacity,
//     required this.close,
//     required this.description,
//     required this.facilities,
//     required this.location,
//     required this.name,
//     required this.open,
//     required this.price,
//     required this.status,
//     required this.type,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         capacity: json["capacity"],
//         close: Close.fromJson(json["close"]),
//         description: json["description"],
//         facilities: json["facilities"],
//         location: json["location"],
//         name: json["name"],
//         open: Close.fromJson(json["open"]),
//         price: json["price"],
//         status: json["status"],
//         type: json["type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "capacity": capacity,
//         "close": close.toJson(),
//         "description": description,
//         "facilities": facilities,
//         "location": location,
//         "name": name,
//         "open": open.toJson(),
//         "price": price,
//         "status": status,
//         "type": type,
//       };
// }

// class Close {
//   Close();

//   factory Close.fromJson(Map<String, dynamic> json) => Close();

//   Map<String, dynamic> toJson() => {};
// }

// class Meta {
//   int code;
//   bool isError;
//   String message;

//   Meta({
//     required this.code,
//     required this.isError,
//     required this.message,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         code: json["code"],
//         isError: json["is_error"],
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "is_error": isError,
//         "message": message,
//       };
// }
