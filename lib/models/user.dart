/*
// model/user_model.dart

class UserModel {
  final String id;
  final String name;
  final String countryCode;
  final String phone;
  final String email;
  final String token;
  final String tokenExpiry;

  UserModel({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.email,
    required this.token,
    required this.tokenExpiry,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      countryCode: json['country_code'],
      phone: json['phone'],
      email: json['email'],
      token: json['token'],
      tokenExpiry: json['token_expiry'],
    );
  }
}
*/
import 'dart:convert';

class RegisterResponse {
  bool? success;
  String? message;
  UserModel? data;

  RegisterResponse({this.success, this.message, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  String? id;
  String? name;
  String? countryCode;
  String? phone;
  String? email;
  String? token;
  String? tokenExpiry;

  UserModel(
      {this.id,
        this.name,
        this.countryCode,
        this.phone,
        this.email,
        this.token,
        this.tokenExpiry});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    tokenExpiry = json['token_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['token'] = this.token;
    data['token_expiry'] = this.tokenExpiry;
    return data;
  }
}