class SignupModel {
  String? firstName;
  String? lastName;
  String? email;

  String? role;
  String? password;

  SignupModel(
      {this.firstName, this.lastName, this.email, this.role, this.password});

  SignupModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['user_role'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;

    data['user_role'] = this.role;
    data['password'] = this.password;

    return data;
  }
}
