//Model utk create order
import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  Meta meta;
  Data data;

  OrderModel({
    required this.meta,
    required this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  int idTransaction;

  Data({
    required this.idTransaction,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idTransaction: json["id_transaction"],
      );

  Map<String, dynamic> toJson() => {
        "id_transaction": idTransaction,
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
