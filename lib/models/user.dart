

import 'dart:convert';

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