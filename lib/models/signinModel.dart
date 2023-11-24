class SigninModel {
  String? email;

  String? password;

  SigninModel({this.email, this.password});

  SigninModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];

    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;

    data['password'] = password;

    return data;
  }
}
