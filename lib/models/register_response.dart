/*
import 'package:mobile_test_task/models/user.dart';

class RegisterModelResponse {
  int? status;
  String? message;
  UserModel? data;

  RegisterModelResponse({this.status, this.message, this.data});

  RegisterModelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}*/
