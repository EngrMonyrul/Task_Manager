class LoginResponse {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? photo;

  LoginResponse(
      {this.email, this.firstName, this.lastName, this.mobile, this.photo});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobile: json["mobile"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
        "photo": photo,
      };
}
