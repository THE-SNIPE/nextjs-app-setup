class Booking {
  final String id;
  final String farmerId;
  final String vetId;
  final String animalType;
  final String? description;
  final String status; // pending, confirmed, declined
  final DateTime time;

  Booking({
    required this.id,
    required this.farmerId,
    required this.vetId,
    required this.animalType,
    this.description,
    required this.status,
    required this.time,
  });

  factory Booking.fromMap(Map<String, dynamic> data, String id) {
    return Booking(
      id: id,
      farmerId: data['farmer_id'] ?? '',
      vetId: data['vet_id'] ?? '',
      animalType: data['animal_type'] ?? '',
      description: data['description'],
      status: data['status'] ?? 'pending',
      time: DateTime.parse(data['time']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'farmer_id': farmerId,
      'vet_id': vetId,
      'animal_type': animalType,
      'description': description,
      'status': status,
      'time': time.toIso8601String(),
    };
  }
}
