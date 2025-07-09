class Clinic {
  final String id;
  final String name;
  final String phone;
  final String whatsapp;
  final double latitude;
  final double longitude;
  final List<String> services;
  final List<double> ratings;

  Clinic({
    required this.id,
    required this.name,
    required this.phone,
    required this.whatsapp,
    required this.latitude,
    required this.longitude,
    required this.services,
    required this.ratings,
  });

  factory Clinic.fromMap(Map<String, dynamic> data, String id) {
    return Clinic(
      id: id,
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      whatsapp: data['whatsapp'] ?? '',
      latitude: (data['lat'] ?? 0).toDouble(),
      longitude: (data['lng'] ?? 0).toDouble(),
      services: List<String>.from(data['services'] ?? []),
      ratings: List<double>.from(data['ratings']?.map((r) => r.toDouble()) ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'whatsapp': whatsapp,
      'lat': latitude,
      'lng': longitude,
      'services': services,
      'ratings': ratings,
    };
  }
}
