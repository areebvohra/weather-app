import 'package:http/http.dart' show Client;
import 'package:weather_app/modal/WeatherData.dart';

class MapApi {
  static const APIkey = "ad8ee6f19ecdc9f2065b5398ac06ee1e";
  static const EndPoint = "http://api.openweathermap.org/data/2.5/";

  double lat, lon;
  Client client = Client();
  static MapApi _instance;

  // ??= means that Assign the value only if the variable is null
  static MapApi getInstance() => _instance ??= MapApi();

  String _apiCall({double lat, double lon}) {
    return EndPoint +
        "/weather?lat=" +
        lat.toString() +
        "&lon=" +
        lon.toString() +
        "&APPID=" +
        APIkey +
        "&units=metric";
  }

  getWeather({double lat, double lon}) async {
    var response = await client.get(
        Uri.encodeFull(_apiCall(lat: lat, lon: lon)),
        headers: {'Accept': 'application/json'});
    return WeatherData.deserialize(response.body);
  }
}
