// To parse this JSON data, do
//
//     final midtransPaymentModel = midtransPaymentModelFromJson(jsonString);

import 'dart:convert';

MidtransPaymentModel midtransPaymentModelFromJson(String str) =>
    MidtransPaymentModel.fromJson(json.decode(str));

String midtransPaymentModelToJson(MidtransPaymentModel data) =>
    json.encode(data.toJson());

class MidtransPaymentModel {
  Meta? meta;
  Data? data;

  MidtransPaymentModel({
    this.meta,
    this.data,
  });

  factory MidtransPaymentModel.fromJson(Map<String, dynamic> json) =>
      MidtransPaymentModel(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta!.toJson(),
        "data": data!.toJson(),
      };
}

class Data {
  String paymentType;
  PaymentData paymentData;
  String status;

  Data({
    required this.paymentType,
    required this.paymentData,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentType: json["payment_type"],
        paymentData: PaymentData.fromJson(json["payment_data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "payment_type": paymentType,
        "payment_data": paymentData.toJson(),
        "status": status,
      };
}

class PaymentData {
  String vaNumber;
  int totalPrice;
  int discount;
  int tax;
  int price;

  PaymentData({
    required this.vaNumber,
    required this.totalPrice,
    required this.discount,
    required this.tax,
    required this.price,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        vaNumber: json["va_number"],
        totalPrice: json["total_price"],
        discount: json["discount"],
        tax: json["tax"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "va_number": vaNumber,
        "total_price": totalPrice,
        "discount": discount,
        "tax": tax,
        "price": price,
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
