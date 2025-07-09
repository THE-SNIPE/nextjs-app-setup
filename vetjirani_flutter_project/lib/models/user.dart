class User {
  final String uid;
  final String role; // 'Farmer' or 'Vet Clinic'
  final String? name;
  final String? phoneNumber;
  final String? email;

  User({
    required this.uid,
    required this.role,
    this.name,
    this.phoneNumber,
    this.email,
  });

  factory User.fromMap(Map<String, dynamic> data, String uid) {
    return User(
      uid: uid,
      role: data['role'] ?? '',
      name: data['name'],
      phoneNumber: data['phoneNumber'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
