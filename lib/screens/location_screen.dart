import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/widgets/hourly_weather.dart'; 
import 'package:weather_app/widgets/weather_card.dart';

class LocationScreen extends StatefulWidget {
  // final UserLocation userLocation;
  final Weather weather_data;

  const LocationScreen({
    super.key,
    // required this.userLocation,
    required this.weather_data,
  });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Color bg = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          WeatherCard(weather_data: widget.weather_data),
       
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today', style: TextStyle(color: Colors.white)),
                Text(
                  '7 days >',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
          HourlyWeather( ),
        ],
      ),
    );
  }
}
