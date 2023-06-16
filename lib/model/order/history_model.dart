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


// // To parse this JSON data, do
// //
// //     final historyModel = historyModelFromJson(jsonString);

// import 'dart:convert';

// HistoryModel historyModelFromJson(String str) =>
//     HistoryModel.fromJson(json.decode(str));

// String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

// class HistoryModel {
//   Meta meta;
//   List<Datum> data;

//   HistoryModel({
//     required this.meta,
//     required this.data,
//   });

//   factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
//         meta: Meta.fromJson(json["meta"]),
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "meta": meta.toJson(),
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   int id;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;
//   int userId;
//   int officeId;
//   int discount;
//   int price;
//   int tax;
//   int totalPrice;
//   DateTime start;
//   DateTime end;
//   bool status;
//   Office office;

//   Datum({
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//     required this.userId,
//     required this.officeId,
//     required this.discount,
//     required this.price,
//     required this.tax,
//     required this.totalPrice,
//     required this.start,
//     required this.end,
//     required this.status,
//     required this.office,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["ID"],
//         createdAt: DateTime.parse(json["CreatedAt"]),
//         updatedAt: DateTime.parse(json["UpdatedAt"]),
//         deletedAt: json["DeletedAt"],
//         userId: json["UserID"],
//         officeId: json["OfficeID"],
//         discount: json["Discount"],
//         price: json["Price"],
//         tax: json["Tax"],
//         totalPrice: json["TotalPrice"],
//         start: DateTime.parse(json["Start"]),
//         end: DateTime.parse(json["End"]),
//         status: json["Status"],
//         office: Office.fromJson(json["Office"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "ID": id,
//         "CreatedAt": createdAt.toIso8601String(),
//         "UpdatedAt": updatedAt.toIso8601String(),
//         "DeletedAt": deletedAt,
//         "UserID": userId,
//         "OfficeID": officeId,
//         "Discount": discount,
//         "Price": price,
//         "Tax": tax,
//         "TotalPrice": totalPrice,
//         "Start": start.toIso8601String(),
//         "End": end.toIso8601String(),
//         "Status": status,
//         "Office": office.toJson(),
//       };
// }

// class Office {
//   int id;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;
//   String name;
//   Description description;
//   int capacity;
//   Type type;
//   String open;
//   String close;
//   int price;
//   Location location;
//   String facilities;

//   Office({
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//     required this.name,
//     required this.description,
//     required this.capacity,
//     required this.type,
//     required this.open,
//     required this.close,
//     required this.price,
//     required this.location,
//     required this.facilities,
//   });

//   factory Office.fromJson(Map<String, dynamic> json) => Office(
//         id: json["ID"],
//         createdAt: DateTime.parse(json["CreatedAt"]),
//         updatedAt: DateTime.parse(json["UpdatedAt"]),
//         deletedAt: json["DeletedAt"],
//         name: json["Name"],
//         description: descriptionValues.map[json["Description"]]!,
//         capacity: json["Capacity"],
//         type: typeValues.map[json["Type"]]!,
//         open: json["Open"],
//         close: json["Close"],
//         price: json["Price"],
//         location: locationValues.map[json["Location"]]!,
//         facilities: json["Facilities"],
//       );

//   Map<String, dynamic> toJson() => {
//         "ID": id,
//         "CreatedAt": createdAt.toIso8601String(),
//         "UpdatedAt": updatedAt.toIso8601String(),
//         "DeletedAt": deletedAt,
//         "Name": name,
//         "Description": descriptionValues.reverse[description],
//         "Capacity": capacity,
//         "Type": typeValues.reverse[type],
//         "Open": open,
//         "Close": close,
//         "Price": price,
//         "Location": locationValues.reverse[location],
//         "Facilities": facilities,
//       };
// }

// enum Description { EMPTY, LOREM_IPSUM_DOLOR_SIT_AMET, BEST_OFFICE }

// final descriptionValues = EnumValues({
//   "best office!": Description.BEST_OFFICE,
//   "": Description.EMPTY,
//   "Lorem Ipsum Dolor sit amet": Description.LOREM_IPSUM_DOLOR_SIT_AMET
// });

// enum Location { EMPTY, JAKARTA, SEMARANG }

// final locationValues = EnumValues({
//   "": Location.EMPTY,
//   "Jakarta": Location.JAKARTA,
//   "Semarang": Location.SEMARANG
// });

// enum Type { EMPTY, OFFICE, COWORKING }

// final typeValues = EnumValues(
//     {"coworking": Type.COWORKING, "": Type.EMPTY, "office": Type.OFFICE});

// class Meta {
//   String message;
//   int code;
//   bool isError;

//   Meta({
//     required this.message,
//     required this.code,
//     required this.isError,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         message: json["message"],
//         code: json["code"],
//         isError: json["is_error"],
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "code": code,
//         "is_error": isError,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }