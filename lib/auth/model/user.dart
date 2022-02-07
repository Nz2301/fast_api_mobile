class User {
  String first_name;
  String last_name;
  String email;
  String password;

  User(
      {required this.first_name,
      required this.last_name,
      required this.email,
      required this.password});

  Map<String, String> toJson() => {
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "password": password
      };
}
