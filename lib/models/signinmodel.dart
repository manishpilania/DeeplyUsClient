class SignInUser {
  String email;
  String password;

  SignInUser({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}