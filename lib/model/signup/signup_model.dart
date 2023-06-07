import 'dart:convert';

SignupModel signupModelfromJson(String str)=>
  signupModelfromJson(json.decode(str));

  String signupModelToJson(SignupModel data)=>json.encode(data.toJson());

class SignupModel{
  String email;
  String username;
  String password;


  SignupModel({
    required this.email,
    required this.username,
    required this.password,

  });
  factory SignupModel.fromJson(Map<String, dynamic> json)=>SignupModel(
    email: json["email"].toString(),
    username: json["username"].toString(),
    password: json["password"].toString(),
    );

    Map<String, dynamic> toJson()=>{
      "email": email,
      "name": username,
      "password": password,

    };

}
class Register{
  int id;
  String createdat;
  String updatedat;
  String deletedat;
  String company;
  String dateBirth;
  String email;
  String gender;
  bool isVerify;
  String name;
  String role;

  Register({
    required this.id,
    required this.updatedat,
    required this.createdat,
    required this.deletedat,
    required this.company,
    required this.dateBirth,
    required this.email,
    required this.gender,
    required this.isVerify,
    required this.name,
    required this.role,
  });
factory Register.fromJson(Map<String, dynamic> json) => Register(
  id:json['ID'] ?? 32,
  createdat: json['CreatedAt'] ?? DateTime.now(),
  updatedat: json['UpdatedAt']?? DateTime.now(),
  deletedat: json['DeletedAt']?? null,
  company:json['company'] ?? 'null',
  dateBirth: json['dateBirth']?? 'null',
  email :json['email']?? String,
  gender: json['gender']?? 'null',
  isVerify : json['isVerify']?? false,
  name : json['name']?? String,
  role : json['role']?? 0,
);



 Map<String, dynamic> toJson() => {
  "updatedat":updatedat,
  "createdat" : createdat,
  "deletedat":deletedat,
  "company": company,
    "dateBirth": dateBirth,
    "email": email,
    "gender": gender,
    "isVerify": isVerify,
    "name": name,
    "role": role
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




