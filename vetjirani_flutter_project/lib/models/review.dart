class Review {
  final String id;
  final String userId;
  final String clinicId;
  final double rating;
  final String comment;
  final DateTime date;

  Review({
    required this.id,
    required this.userId,
    required this.clinicId,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory Review.fromMap(Map<String, dynamic> data, String id) {
    return Review(
      id: id,
      userId: data['user_id'] ?? '',
      clinicId: data['clinic_id'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      comment: data['comment'] ?? '',
      date: DateTime.parse(data['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'clinic_id': clinicId,
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
    };
  }
}
