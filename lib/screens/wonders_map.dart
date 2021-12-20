import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:world_wonders/data/world_wonders.dart';

class WonderMapScreen extends StatefulWidget {
  const WonderMapScreen({Key? key}) : super(key: key);

  static const routeName = "/wonder-map";

  @override
  State<WonderMapScreen> createState() => _WonderMapScreenState();
}

class _WonderMapScreenState extends State<WonderMapScreen> {
  final Set<Marker> markers = {};
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final WorldWonder wonder = parsedData["wonder"];
    markers.add(Marker(
      markerId: MarkerId(wonder.latLong.toString()),
      position: wonder.latLong,
      infoWindow: InfoWindow(title: wonder.name, snippet: wonder.description),
    ));

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
      mapController.showMarkerInfoWindow(MarkerId(wonder.latLong.toString()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(wonder.name),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: wonder.latLong, zoom: 11.0),
        markers: markers,
      ),
    );
  }
}
