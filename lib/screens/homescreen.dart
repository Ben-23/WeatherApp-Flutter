import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climaapp/services/weather_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.weatherData);
  final WeatherData weatherData;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.sort,
          color: Colors.black,
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print('search clicked');
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
        title: Text(
          'Weather Forecast',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Icon(
              Icons.wb_sunny,
              color: Colors.orange[400],
              size: 40.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              '${widget.weatherData.temperature}°C',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              '${widget.weatherData.cityName},${widget.weatherData.country}',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Wind",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${widget.weatherData.wind} km/h",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                height: 140,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/group1.png'))),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Humidity",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xdfffffff),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${widget.weatherData.humidity}%",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                height: 140,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/group2.png'))),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Presure",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xdfffffff),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${widget.weatherData.pressure}Pa",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                height: 140,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/group3.png'))),
              )
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              'Additional Info',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Description: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  '${widget.weatherData.desc}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Sunrise  : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  widget.weatherData.sr,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Sunset : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  widget.weatherData.st,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Visiblity : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  widget.weatherData.visibility,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
