import 'package:climaapp/screens/homescreen.dart';
import 'package:climaapp/services/device_location.dart';
import 'package:climaapp/services/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

int loadComplete;
dynamic wResult;
DLocation dLocation = DLocation();
WeatherData weatherData = WeatherData();
bool lo = false;
bool btn = true;

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void getLocation() async {
    await dLocation.getDLocation();
    await weatherData.getWeatherData(dLocation);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    loadComplete = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Welcome To My Weather App',
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            Image(
              image: AssetImage('images/weatherimage.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Get live Weather updates of your location and weather details of other countries',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black54,
                    fontSize: 15),
              ),
            ),
            Visibility(
              visible: btn,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0)),
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    btn = false;
                    lo = true;
                  });
                  getLocation();
                },
              ),
            ),
            Visibility(
              visible: lo,
              child: SpinKitWanderingCubes(
                color: Colors.black,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
