import 'package:flutter/material.dart';
import 'colors.dart'; // Import your colors file
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'carousel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Set your location"),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/backbutton.svg',
                  // Replace with the path to your SVG file
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ]

        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: {
            const Marker(
              markerId: MarkerId('Sydney'),
              position: LatLng(-33.86, 151.20),
              infoWindow: InfoWindow(
                title: "Sydney",
                snippet: "Capital of New South Wales",
              ), // InfoWindow
            )
          },
        )
    );
  }
}
