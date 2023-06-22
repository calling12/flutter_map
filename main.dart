import 'dart:async';
import 'package:App/futurn/displayBottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'futurn/displayBottomsheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EV mobile app',
      home: MapSample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(17.939372, 102.626805),
    zoom: 14.4746,
  );

  static final CameraPosition _KLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(17.939372, 102.626805),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    final Marker kGooglePlexMarker = Marker(
        markerId: MarkerId('_KGooglePlex'),
        infoWindow: InfoWindow(title: 'EV ຄ ວ ສ'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(17.939372, 102.626805),
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              barrierColor: Colors.black87.withOpacity(0.5),
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              builder: (context) {
                return displayBottomsheet();
              });
        });
    final Marker kGooglePlexMarker2 = Marker(
        markerId: MarkerId('_KGooglePlex'),
        infoWindow: InfoWindow(title: 'EV ໄຟຟ້າລາວ'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(17.9409816, 102.6274970),
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              barrierColor: Colors.black87.withOpacity(0.5),
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              builder: (context) {
                return displayBottomsheet();
              });
        });
    final Marker _KGooglePlexMarker3 = Marker(
        markerId: MarkerId('_KGooglePlex'),
        infoWindow: InfoWindow(title: 'EV'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(17.9644764, 102.6342550),
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              barrierColor: Colors.black87.withOpacity(0.5),
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              builder: (context) {
                return displayBottomsheet();
              });
        });

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            markers: {
              kGooglePlexMarker,
              kGooglePlexMarker2,
              _KGooglePlexMarker3,
            },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _goTOThelake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_KLake));
  }
}
