import 'package:meta/meta.dart';

class UserLogin {
  String? username;
  String? password;

  UserLogin({this.username, this.password});

  Map<String, dynamic> toDatabaseJson() =>
      {"username": this.username, "password": this.password};
}

class Tokenn {
  String? token;

  Tokenn({this.token});

  factory Tokenn.fromJson(Map<String, dynamic> json) {
    return Tokenn(token: json['token']);
  }
}

class TenantIndividualRegister {
  TenantIndividualRegister({
    required this.password,
    required this.password2,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.username,
    required this.phone,
  });

  String? password;
  String? password2;
  String? email;
  String? first_name;
  String? last_name;
  String? username;
  String? phone;

  factory TenantIndividualRegister.fromJson(Map<String, dynamic> json) =>
      TenantIndividualRegister(
        password: json["password"],
        password2: json["password2"],
        email: json["email"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        username: json["username"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "password2": password2,
        "email": email,
        "first_name": first_name,
        "last_name": last_name,
        "username": username,
        "phone": phone,
      };
}

class TenantCompanyRegister {
  TenantCompanyRegister({
    required this.password,
    required this.password2,
    required this.email,
    required this.company_name,
    required this.username,
    required this.phone,
  });

  String? password;
  String? password2;
  String? email;
  String? company_name;
  String? username;
  String? phone;

  factory TenantCompanyRegister.fromJson(Map<String, dynamic> json) =>
      TenantCompanyRegister(
        password: json["password"],
        password2: json["password2"],
        email: json["email"],
        company_name: json["company_name"],
        username: json["username"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "password2": password2,
        "email": email,
        "company_name": company_name,
        "username": username,
        "phone": phone,
      };
}
