# VetJirani Flutter App

This is the full Flutter project source code for the VetJirani mobile application, implementing the UI/UX design and functionality as specified.

## Features

- Farmer and Vet Clinic roles
- Phone OTP authentication and Google sign-in (Vet)
- Role selection and storage
- Farmer side: splash, home map with Google Maps, vet list, clinic profile, booking, booking history, ratings, knowledge hub, profile/settings
- Vet side: dashboard, bookings management, profile management, reviews, stats, settings
- Firebase Firestore backend and Cloud Messaging integration
- Communication via phone dialer and WhatsApp intents
- Offline support for knowledge hub
- Modern black and green theme with Google Fonts

## Setup Instructions

1. Install Flutter SDK: https://flutter.dev/docs/get-started/install
2. Clone this repository or download the source code.
3. Configure Firebase project and add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files in the respective directories.
4. Run `flutter pub get` to install dependencies.
5. Run the app on an emulator or physical device using `flutter run`.

## Folder Structure

- `lib/`
  - `main.dart` - App entry point
  - `models/` - Data models (User, Clinic, Booking, Review)
  - `services/` - Firebase and local storage services
  - `screens/` - UI screens for Farmer and Vet roles
  - `widgets/` - Reusable UI components
  - `utils/` - Helper functions and constants
  - `data/` - CSV parsing and local data

## Notes

- The vet clinic locations are loaded from a CSV file and synced with Firestore.
- The app uses Google Maps Flutter plugin for map views.
- Firebase Cloud Messaging is used for real-time booking notifications.

## Contact

For any questions or support, please contact the developer.
