import 'dart:convert';

BookingAvailabilityModel bookingAvailabilityModelFromJson(String str) =>
    BookingAvailabilityModel.fromJson(json.decode(str));

String bookingAvailabilityModelToJson(BookingAvailabilityModel data) =>
    json.encode(data.toJson());

class BookingAvailabilityModel {
  Meta meta;
  dynamic data;

  BookingAvailabilityModel({
    required this.meta,
    this.data,
  });

  factory BookingAvailabilityModel.fromJson(Map<String, dynamic> json) =>
      BookingAvailabilityModel(
        meta: Meta.fromJson(json["meta"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data,
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
