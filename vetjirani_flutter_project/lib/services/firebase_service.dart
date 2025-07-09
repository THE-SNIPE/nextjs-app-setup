import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import '../models/user.dart' as app_user;
import '../models/clinic.dart';
import '../models/booking.dart';
import '../models/review.dart';

class FirebaseService {
  final fb_auth.FirebaseAuth _auth = fb_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  // Authentication

  Future<fb_auth.User?> signInWithPhone(String phoneNumber, Function(String) codeSent) async {
    // TODO: Implement phone auth with verification code callback
    return null;
  }

  Future<fb_auth.User?> signInWithGoogle() async {
    // TODO: Implement Google sign-in
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // User Data

  Future<void> saveUserData(app_user.User user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<app_user.User?> getUserData(String uid) async {
    var doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return app_user.User.fromMap(doc.data()!, uid);
    }
    return null;
  }

  // Clinics

  Stream<List<Clinic>> getClinicsStream() {
    return _firestore.collection('clinics').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Clinic.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> addOrUpdateClinic(Clinic clinic) async {
    await _firestore.collection('clinics').doc(clinic.id).set(clinic.toMap());
  }

  // Bookings

  Stream<List<Booking>> getBookingsForUser(String userId, String role) {
    Query query;
    if (role == 'Farmer') {
      query = _firestore.collection('bookings').where('farmer_id', isEqualTo: userId);
    } else {
      query = _firestore.collection('bookings').where('vet_id', isEqualTo: userId);
    }
    return query.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Booking.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> createBooking(Booking booking) async {
    await _firestore.collection('bookings').add(booking.toMap());
    // TODO: Trigger FCM notification to vet
  }

  Future<void> updateBookingStatus(String bookingId, String status) async {
    await _firestore.collection('bookings').doc(bookingId).update({'status': status});
  }

  // Reviews

  Stream<List<Review>> getReviewsForClinic(String clinicId) {
    return _firestore.collection('reviews')
        .where('clinic_id', isEqualTo: clinicId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Review.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> addReview(Review review) async {
    await _firestore.collection('reviews').add(review.toMap());
  }

  // FCM Token

  Future<void> saveFcmToken(String uid, String token) async {
    await _firestore.collection('users').doc(uid).update({'fcm_token': token});
  }

  Future<String?> getFcmToken() async {
    return await _messaging.getToken();
  }
}
