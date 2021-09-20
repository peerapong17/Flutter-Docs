import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  static const routeName = 'GoogleMap';

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();
  LocationData? locationData;
  double? lat, long;

  Future<void> getCurrentLocation() async {
    await findLocationData();
    setState(() {
      lat = locationData!.latitude;
      long = locationData!.longitude;
    });
  }

  Future<LocationData> findLocationData() async {
    try {
      locationData = await location.getLocation();
    } catch (e) {
      print(e);
    }
    return locationData!;
  }

  // Set<Marker> myMarker() {
  //   return <Marker>[
  //     Marker(
  //         markerId: MarkerId('My Shop'),
  //         position: LatLng(13.7297, 100.4358),
  //         infoWindow: InfoWindow(
  //             title: "Intermedical Hostpital",
  //             snippet: "Lat${lat} Long${long}"))
  //   ].toSet();
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: lat == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            )
          : GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(13.7297, 100.4358),
                zoom: 14,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: [
                Marker(
                    markerId: MarkerId('My Shop'),
                    position: LatLng(13.7297, 100.4358),
                    infoWindow: InfoWindow(
                        title: "Intermedical Hostpital",
                        snippet: "Lat$lat Long$long"))
              ].toSet(),
            ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _getCurrentPosition();
      //   },
      // ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
