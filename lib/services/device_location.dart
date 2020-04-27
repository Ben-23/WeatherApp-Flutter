import 'package:geolocator/geolocator.dart';

class DLocation {
  double latitude;
  double longitude;
  Future<void> getDLocation() async {
    try {
      GeolocationStatus geolocationStatus =
          await Geolocator().checkGeolocationPermissionStatus();
      if (geolocationStatus == GeolocationStatus.disabled) {
      } else {
        Position position = await Geolocator()
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
