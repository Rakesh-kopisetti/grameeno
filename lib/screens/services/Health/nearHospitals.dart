import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class NearbyHospitalsHelper {
  static Future<void> openNearbyHospitals() async {
    try {
      // Request location permission
      var status = await Permission.location.request();
      if (!status.isGranted) {
        throw Exception('Location permission denied');
      }

      // Get current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Construct Google Maps URL
      final url =
          'https://www.google.com/maps/search/hospitals/@${position.latitude},${position.longitude},15z';

      // Launch Google Maps
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch Google Maps');
      }
    } catch (e) {
      print('NearbyHospitalsHelper Error: $e');
      // Handle error or pass it up if needed
    }
  }
}
