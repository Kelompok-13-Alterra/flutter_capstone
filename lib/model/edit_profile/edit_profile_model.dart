import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) {
  final jsonData = json.decode(str);
  return EditProfileModel.fromJson(jsonData);
}

String editProfileModelToJson(EditProfileModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class EditProfileModel {
  List<Profile> data;
  Meta meta;

  EditProfileModel({
    required this.data,
    required this.meta,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      EditProfileModel(
        data: List<Profile>.from(json["data"].map((x) => Profile.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Profile {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  String name;
  String email;
  String company;
  String gender;
  String dateBirth;
  int role;
  bool isVerify;

  Profile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.email,
    required this.company,
    required this.gender,
    required this.dateBirth,
    required this.role,
    required this.isVerify,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["ID"] ?? 'null',
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        name: json["Name"] ?? 'null',
        email: json["Email"] ?? 'null',
        company: json["Company"] ?? 'null',
        gender: json["Gender"] ?? 'null',
        dateBirth: json["DateBirth"] ?? 'null',
        role: json["Role"] ?? 'null',
        isVerify: json["IsVerify"] ?? 'null',
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "Name": name,
        "Email": email,
        "Company": company,
        "Gender": gender,
        "DateBirth": dateBirth,
        "Role": role,
        "IsVerify": isVerify,
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
