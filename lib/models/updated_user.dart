class UpdatedUser {
  String? id;
  String? name;
  String? countryCode;
  String? phone;
  String? email;

  UpdatedUser({this.id, this.name, this.countryCode, this.phone, this.email});

  UpdatedUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}