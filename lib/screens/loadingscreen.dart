import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/models/user_location.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/location_screen.dart';

import 'package:http/http.dart' as http;
// هون حطينا ك اسم مستعار لحتى نتعامل معو مباشرة بدل ما اكتب الرابط كامل
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/networking.dart';

class Loadingscreen extends StatefulWidget {
  Loadingscreen({super.key});
  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {

  Future<void> getLocationWeather() async {
    UserLocation userLocation = UserLocation();
    await userLocation.getUserLocation(context);
    Weather weather = Weather();
    try {
    await weather.getWeather(  "https://api.openweathermap.org/data/2.5/weather?lat=${userLocation.latitude}&lon=${userLocation.longitude}");
     if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(weather_data: weather),
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
          strokeAlign: 5.0,
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
