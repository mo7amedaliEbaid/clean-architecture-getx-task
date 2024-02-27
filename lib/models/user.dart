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
