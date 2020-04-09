import 'package:flutter/material.dart';
import 'package:weather_app/modal/MapApi.dart';
import 'package:weather_app/ui/Weather.dart';
import 'package:weather_app/modal/WeatherData.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData _weatherData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _weatherData != null
          ? Weather(weatherData: _weatherData)
          : Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
    );
  }

  getCurrentLocation() {
    loadWeather(lat: 24.8667795, lon: 67.0311286);
  }

  loadWeather({double lat, double lon}) async {
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat, lon: lon);
    
    setState(() {
      this._weatherData = data;
    });
  }
}
