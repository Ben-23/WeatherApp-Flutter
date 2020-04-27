import 'dart:convert';

import 'package:climaapp/services/device_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  var apiKey = "f0228e2fecaa8be288a4c84ccfb5789a";
  http.Response response;
  var decodedData;
  var temperature;
  var humidity;
  var pressure;
  var wind;
  var cityName;
  var country;
  var desc;
  IconData weatherIcon;
  var st, sr;
  DateTime sunrise, sunset;

  Future<void> getWeatherData(DLocation dLocation) async {
    try {
      response = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${dLocation.latitude}&lon=${dLocation.longitude}&appid=$apiKey&units=metric');
      String data = response.body;
      decodedData = jsonDecode(data);
      temperature = decodedData['main']['temp'];
      pressure = decodedData['main']['pressure'];
      wind = decodedData['wind']['speed'];
      humidity = decodedData['main']['humidity'];
      cityName = decodedData['name'];
      country = decodedData['sys']['country'];
      desc = decodedData['weather'][0]['main'];
      sunrise =
          DateTime.fromMillisecondsSinceEpoch(decodedData['sys']['sunrise']);
      sunset =
          DateTime.fromMillisecondsSinceEpoch(decodedData['sys']['sunset']);
      sr = "${sunrise.hour}:${sunrise.minute} AM";
      st = "${sunset.hour}:${sunset.minute} PM";
    } catch (e) {
      print('An unexpected exception caught $e');
    }
  }
}
