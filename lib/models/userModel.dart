class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  Null? bio;
  String? password;
  String? userRole;
  Null? verifiedAt;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.bio,
      this.password,
      this.userRole,
      this.verifiedAt,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    bio = json['bio'];
    password = json['password'];
    userRole = json['user_role'];
    verifiedAt = json['verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['password'] = this.password;
    data['user_role'] = this.userRole;
    data['verified_at'] = this.verifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
