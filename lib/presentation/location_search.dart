import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:liqart/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:geolocator/geolocator.dart';

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
        builder: (context, appState, _) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF8E5621),
                // on below line we have given title of app
                actions: [
                  IconButton(
                      onPressed: () {
                        appState.panelController.close();
                      },
                      icon: SvgPicture.asset('assets/x.svg',
                          height: 24, width: 24))
                ],
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0), // Adjust the top padding as needed
                  child: Text(
                    "Search Your Location",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
    );
  }
}

//   body: Container(
//     child: SafeArea(
//       // on below line creating google maps
//       child: GoogleMap(
//         // on below line setting camera position
//         initialCameraPosition: _kGoogle,
//         // on below line we are setting markers on the map
//         markers: Set<Marker>.of(_marker),
//         // on below line specifying map type.
//         mapType: MapType.normal,
//         // on below line setting user location enabled.
//         myLocationEnabled: true,
//         // on below line setting compass enabled.
//         compassEnabled: true,
//         // on below line specifying controller on map complete.
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     ),
//   ),
//   // on pressing floating action button the camera will take to user current location
//   floatingActionButton: FloatingActionButton(
//     onPressed: () async {
//       getUserCurrentLocation().then((value) async {
//         print(value.latitude.toString() + " " + value.longitude.toString());
//
//         // marker added for current users location
//         _markers.add(Marker(
//           markerId: MarkerId("2"),
//           position: LatLng(value.latitude, value.longitude),
//           infoWindow: InfoWindow(
//             title: 'My Current Location',
//           ),
//         ));
//
//         // specified current users location
//         CameraPosition cameraPosition = new CameraPosition(
//           target: LatLng(value.latitude, value.longitude),
//           zoom: 14,
//         );
//
//         final GoogleMapController controller = await _controller.future;
//         controller
//             .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//         setState(() {});
//       });
//     },
//     child: Icon(Icons.local_activity),
//   ),
class PanelUI extends StatelessWidget {
  const PanelUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// child: SlidingUpPanel(
// minHeight: MediaQuery.of(context).size.height * 0.2,
// maxHeight: MediaQuery.of(context).size.height * 0.8,
// panel: PanelUI(),
// body:  Column(
// children: [
// TextField(
// controller: _searchController,
// onChanged: (query) {
// _fetchLocationSuggestions(query);
// },
// decoration: InputDecoration(
// labelText: 'Enter your location',
// ),
// ),
// SizedBox(height: 10),
// Expanded(
// child: _suggestions.isNotEmpty
// ? ListView.builder(
// itemCount: _suggestions.length,
// itemBuilder: (context, index) {
// final suggestion = _suggestions[index];
// return ListTile(
// title: Text(suggestion),
// onTap: () {
// // Handle the selected suggestion
// print('Selected: $suggestion');
// _searchController.text = suggestion;
// // You can do further actions here, such as initiating a search or updating the UI.
// },
// );
// },
// )
// : Container(),
// ),
// ],
// )
// )

// Completer<GoogleMapController> _controller = Completer();
//
// // on below line we have specified camera position
// static final CameraPosition _kGoogle = const CameraPosition(
//   target: LatLng(20.42796133580664, 80.885749655962),
//   zoom: 14.4746,
// );
//
// // on below line we have created the list of markers
// final List<Marker> _markers = <Marker>[
//   Marker(
//       markerId: MarkerId('1'),
//       position: LatLng(20.42796133580664, 75.885749655962),
//       infoWindow: InfoWindow(
//         title: 'My Position',
//       )),
// ];
//
// // created method for getting user current location
// Future<Position> getUserCurrentLocation() async {
//   await Geolocator.requestPermission()
//       .then((value) {})
//       .onError((error, stackTrace) async {
//     await Geolocator.requestPermission();
//     print("ERROR" + error.toString());
//   });
//   return await Geolocator.getCurrentPosition();

// TextEditingController _searchController = TextEditingController();
// List<String> _suggestions = [];
//
// void _fetchLocationSuggestions(String query) async {
//   final response = await http.get(
//     Uri.parse(
//         'https://api.location-suggestion-service.com/suggestions?query=$query'),
//   );
//
//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     final List<String> suggestions =
//         data.map<String>((item) => item['locationName'] as String).toList();
//     setState(() {
//       _suggestions = suggestions;
//     });
//   }
