import 'dart:convert';

class SignupResponseModel {
  String? message;
  User? user;

  SignupResponseModel({this.message, this.user});

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    return data;
  }
}

class User {
  bool? isAdmin;
  String? sId;
  String? name;
  String? email;
  String? password;
  int? phone;
  String? city;
  String? registrationDate;
  int? iV;

  User(
      {this.isAdmin,
        this.sId,
        this.name,
        this.email,
        this.password,
        this.phone,
        this.city,
        this.registrationDate,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    isAdmin = json['isAdmin'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    city = json['city'];
    registrationDate = json['registrationDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAdmin'] = this.isAdmin;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['registrationDate'] = this.registrationDate;
    data['__v'] = this.iV;
    return data;
  }
}
