class Login {
  String? email;
  String? password;

  Login({this.email, this.password});

  Login copyWith({String? email, String? password}) =>
      Login(email: email ?? this.email, password: password ?? this.password);

  factory Login.fromJson(Map<String, dynamic> json) =>
      Login(email: json["email"], password: json["password"]);

  Map<String, dynamic> toJson() => {"email": email, "password": password};

  bool get isValid {
    if (email != null && password != null) return true;
    return false;
  }

  @override
  String toString() => "Email: $email, Password: $password";
}
