import 'package:flutter/material.dart';
import 'package:milckoapk/providers/location_provider.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const String id = 'map-screen';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //final locationData = Provider.of<LocationProvider>(context);

  late LocationProvider locationData; // Declare but don't initialize here

  @override
  void initState() {
    super.initState();
    locationData = Provider.of<LocationProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${locationData.latitude}${locationData.longitude} : '
        )
      ),
    );
  }
}