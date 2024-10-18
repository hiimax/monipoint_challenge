import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapControllers {
  static late GoogleMapController? _mapController;

  GoogleMapController? get mapController => _mapController;

  void set controller(GoogleMapController? controller) {
    _mapController = controller;
  }

   static const CameraPosition _cameraPosition = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(59.9388, 30.4179),
    tilt: 59.440717697143555,
    zoom: 13,
  );
  CameraPosition get cameraPosition => _cameraPosition;
  static final List<LatLng> _markerLocations = [
    LatLng(59.9388, 30.4179), 
    LatLng(59.9319, 30.4373), 
    LatLng(59.9306, 30.4475), 
    LatLng(59.9234, 30.3856), 
    LatLng(59.9466, 30.3954), 
    LatLng(59.9530, 30.4211), 
    LatLng(59.9311, 30.3609), 
    LatLng(59.9316, 30.3601), 
    LatLng(59.9489, 30.3801), 
    LatLng(59.9424, 30.3776), 
  ];

  List<LatLng> get markerLocations => _markerLocations;
}
