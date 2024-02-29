import 'package:mobile_test_task/models/models.dart';

class UpdateUserResponse {
  bool? success;
  String? message;
  UpdatedUser? data;

  UpdateUserResponse({this.success, this.message, this.data});

  UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UpdatedUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

