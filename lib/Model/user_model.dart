class User {
  String email;
  String name;

  User({
    this.email = 'N/A',
    this.name = 'N/A',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? 'N/A',
      name: json['name'] ?? 'N/A',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
    };
  }
}
