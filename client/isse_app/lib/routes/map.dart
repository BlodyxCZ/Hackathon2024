// packages
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
      ),
      body: Center(
        child: FlutterMap(
          mapController: mapController,
          options: const MapOptions(
            initialCenter: LatLng(50.1071528, 14.4502697),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              tileProvider: CancellableNetworkTileProvider(),
            ),
            const MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(50.1071528, 14.4502697),
                  child: Icon(Icons.location_on),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
