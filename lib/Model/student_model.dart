class Student {
  String address;
  int age;
  String createdAt;
  String email;
  String fullName;
  String phoneNumber;

  // Constructor with default values
  Student({
    this.address = 'N/A',
    this.age = 0,
    this.createdAt = 'N/A',
    this.email = 'N/A',
    this.fullName = 'N/A',
    this.phoneNumber = 'N/A',
  });

  // Factory method to create a Student object from Firebase data
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      address: json['address'] ?? 'N/A',
      age: json['age'] ?? 0,
      createdAt: json['createdAt'] ?? 'N/A',
      email: json['email'] ?? 'N/A',
      fullName: json['fullName'] ?? 'N/A',
      phoneNumber: json['phoneNumber'] ?? 'N/A',
    );
  }

  // Convert a Student object to JSON for sending to Firebase
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'age': age,
      'createdAt': createdAt,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }
}
