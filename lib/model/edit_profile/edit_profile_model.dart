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
  String company;
  String dateBirth;
  String email;
  String gender;
  bool isVerify;
  String name;
  int role;

  Profile({
    required this.company,
    required this.dateBirth,
    required this.email,
    required this.gender,
    required this.isVerify,
    required this.name,
    required this.role,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        company: json["Company"] ?? 'null',
        dateBirth: json["DateBirth"] ?? 'null',
        email: json["Email"] ?? 'null',
        gender: json["Gender"] ?? 'null',
        isVerify: json["IsVerify"] ?? 'null',
        name: json["Name"] ?? 'null',
        role: json["Role"] ?? 'null',
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "dateBirth": dateBirth,
        "email": email,
        "gender": gender,
        "isVerify": isVerify,
        "name": name,
        "role": role,
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
