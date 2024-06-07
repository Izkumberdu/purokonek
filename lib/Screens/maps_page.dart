import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:purokonek/Constants/styles.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(10.289615345114814, 123.86960239438125), zoom: 15.1);

  late GoogleMapController _googleMapController;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              size: 40,
            )),
        title: const Text("Barangay Services Location"),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
          Marker(
            markerId: MarkerId('Barangay Hall'),
            position: LatLng(10.286127837935986, 123.87041949848404),
            infoWindow: InfoWindow(title: 'Basak San Nicolas Barangay Hall'),
          ),
          Marker(
            markerId: MarkerId('Alumnos Gym'),
            position: LatLng(10.28455345265687, 123.87343683298056),
            infoWindow: InfoWindow(title: 'Alumnos Gym'),
          ),
          Marker(
            markerId: MarkerId('Day Care'),
            position: LatLng(10.284460944325819, 123.8732885873152),
            infoWindow: InfoWindow(title: 'Day Care'),
          ),
          Marker(
            markerId: MarkerId('Basak Community School'),
            position: LatLng(10.286136029876577, 123.87094852914615),
            infoWindow: InfoWindow(title: 'Basak Community School'),
          ),
          Marker(
            markerId: MarkerId('Saint Anthony Mother & Child Hospital'),
            position: LatLng(10.286467612031359, 123.8711384814525),
            infoWindow:
                InfoWindow(title: 'Saint Anthony Mother & Child Hospital'),
          ),
          Marker(
            markerId: MarkerId('Don Vicente Rama Memorial School'),
            position: LatLng(10.289172256263782, 123.86631516668172),
            infoWindow: InfoWindow(title: 'Don Vicente Rama Memorial School'),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kGreen,
        foregroundColor: kBlack,
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: Icon(
          Icons.center_focus_strong,
          color: kBlack,
        ),
      ),
    );
  }
}
