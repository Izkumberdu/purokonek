import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(10.289615345114814, 123.86960239438125));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Barangay Services Location"),
      ),
      body: GoogleMap(initialCameraPosition: _initialCameraPosition),
    );
  }
}
