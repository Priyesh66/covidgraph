import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';

import 'locations.dart' as users;


class Heatmap extends StatefulWidget {
  @override
  _heatmapState createState() => _heatmapState();
}

class _heatmapState extends State<Heatmap> {
  double density(int active) {
    double radius = 0.0;
    if (active > 10000) {
      radius = 100000;
    } else if (active > 1000) {
      radius = 50000;
    } else if (active > 750) {
      radius = 40000;
    } else if (active > 500) {
      radius = 30000;
    } else if (active > 250) {
      radius = 20000;
    } else if (active > 50) {
      radius = 10000;
    } else if (active > 0) {
      radius = 5000;
    }
    return radius;
  }

  Future<void> _f1(String i, String j, int a) async {
    final query = j + ',' + i;
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    setState(() {
      final circle = Circle(
        circleId: CircleId(j),
        center: LatLng(first.coordinates.latitude, first.coordinates.longitude),
        radius: density(a),
        fillColor: Colors.redAccent.withOpacity(0.5),
        strokeWidth: 2,
        strokeColor: Colors.redAccent,
      );
      _circles[j] = circle;
    });
  }

  final Map<String, Circle> _circles = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final office = await users.fetchListUser();
    setState(() {
      for (var i in office.keys) {
        for (var j in office[i]['districtData'].keys) {
          if (i != "State Unassigned") {
            _f1(i, j, office[i]['districtData'][j]['active']);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Heat Map'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(20.5937, 78.962),
            zoom: 5,
          ),
          circles: _circles.values.toSet(),
        ),
      ),
    );
  }
}

