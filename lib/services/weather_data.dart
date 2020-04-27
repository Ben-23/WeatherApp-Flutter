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
  var visibility;

  var st, sr;
  DateTime sunrise, sunset;

  String formatHour(DateTime dateTime) {
    if (dateTime.hour > 12) {
      return "${dateTime.hour - 12}";
    } else
      return "${dateTime.hour}";
  }

  String formatMin(DateTime dateTime) {
    if (dateTime.minute < 10) {
      return "0${dateTime.minute}";
    } else
      return "${dateTime.minute}";
  }

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
      sunrise = DateTime.fromMillisecondsSinceEpoch(
          (decodedData['sys']['sunrise']) * 1000);
      sunset = DateTime.fromMillisecondsSinceEpoch(
          (decodedData['sys']['sunset']) * 1000);

      sr = formatHour(sunrise) + ":" + formatMin(sunrise) + " AM";
      st = formatHour(sunset) + ":" + formatMin(sunset) + " PM";
      visibility = (decodedData['visibility']).toString() + " Meter";
    } catch (e) {
      print('An unexpected exception caught $e');
    }
  }
}
