import 'dart:convert';

class WeatherData {
  String name;
  String main;
  String icon;
  double temp;

  WeatherData({this.name, this.temp, this.main, this.icon});

  static Future<WeatherData> deserialize(String json) async {
    JsonDecoder decoder = JsonDecoder();
    var map = await decoder.convert(json);

    String name = map['name'];
    String icon = map['weather'][0]['icon'];
    String main = map['weather'][0]['main'];
    double temp = double.parse((map['main'])['temp'].toString());

    return WeatherData(name: name, temp: temp, main: main, icon: icon);
  }
}