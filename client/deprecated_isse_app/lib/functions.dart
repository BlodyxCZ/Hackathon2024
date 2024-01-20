// packages
import 'package:http/http.dart';
// files
import 'package:isse_app/globals.dart';

List<Location> searchLocations(String search) {
  for (Location location in locatitons) {
    String string =
        "${location.memberOwner.firstName} ${location.memberOwner.lastName} ${location.address.street} ${location.address.code} ${location.address.postalCode} ${location.address.city} ${location.address.region}";
    if (string.toLowerCase().contains(search.toLowerCase())) {
      return [location];
    }
  }
  return [];
}

Future<List<Location>> getAllLocations() async {
  Response response = await get(
    Uri.http(apiUrl, "/locations"),
  );
  print(response.body);

  return [];
}
