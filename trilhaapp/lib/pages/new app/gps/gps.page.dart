import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsPage extends StatefulWidget {
  const GpsPage({super.key});

  @override
  State<GpsPage> createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  String latitude = '';
  String longitude = '';
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Latitude: $latitude',
                    style: const TextStyle(fontSize: 15, color: Colors.black)),
                const SizedBox(width: 15),
                Text('Longitude: $longitude',
                    style: const TextStyle(fontSize: 15, color: Colors.black))
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                Position position = await _determinePosition();
                debugPrint(position.toString());

                setState(() {
                  longitude = position.longitude.toString();
                  latitude = position.latitude.toString();
                });
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
              child: const Text(
                'Obter podicao',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
