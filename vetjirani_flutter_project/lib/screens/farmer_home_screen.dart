import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../models/clinic.dart';

class FarmerHomeScreen extends StatefulWidget {
  @override
  _FarmerHomeScreenState createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-1.2921, 36.8219); // Nairobi default location

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadVetClinicsFromCSV();
  }

  Future<void> _loadVetClinicsFromCSV() async {
    final rawData = await rootBundle.loadString('lib/data/kenya_vet_coordinates.csv');
    List<Clinic> clinics = [];
    List<String> lines = rawData.split('\n');
    for (int i = 1; i < lines.length; i++) {
      if (lines[i].trim().isEmpty) continue;
      List<String> fields = _parseCsvLine(lines[i]);
      if (fields.length < 7) continue;
      clinics.add(Clinic(
        id: fields[1],
        name: fields[0],
        phone: fields[5],
        whatsapp: fields[5],
        latitude: double.tryParse(fields[2]) ?? 0,
        longitude: double.tryParse(fields[3]) ?? 0,
        services: [],
        ratings: [],
      ));
    }
    setState(() {
      _markers = clinics.map((clinic) {
        return Marker(
          markerId: MarkerId(clinic.id),
          position: LatLng(clinic.latitude, clinic.longitude),
          infoWindow: InfoWindow(title: clinic.name, snippet: clinic.phone),
        );
      }).toSet();
    });
  }

  List<String> _parseCsvLine(String line) {
    List<String> result = [];
    bool inQuotes = false;
    StringBuffer current = StringBuffer();
    for (int i = 0; i < line.length; i++) {
      var char = line[i];
      if (char == '"') {
        inQuotes = !inQuotes;
      } else if (char == ',' && !inQuotes) {
        result.add(current.toString());
        current.clear();
      } else {
        current.write(char);
      }
    }
    result.add(current.toString());
    return result;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VetJirani - Farmer Home'),
        backgroundColor: Color(0xFF162013),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12.0,
        ),
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'listView',
            onPressed: () {
              // TODO: Navigate to Vet Clinic List View
            },
            backgroundColor: Color(0xFF53D22C),
            child: Icon(Icons.list, color: Color(0xFF162013)),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'emergencyCall',
            onPressed: () {
              // TODO: Implement emergency call
            },
            backgroundColor: Color(0xFF53D22C),
            child: Icon(Icons.call, color: Color(0xFF162013)),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'languageToggle',
            onPressed: () {
              // TODO: Implement language toggle
            },
            backgroundColor: Color(0xFF53D22C),
            child: Icon(Icons.language, color: Color(0xFF162013)),
          ),
        ],
      ),
    );
  }
}
