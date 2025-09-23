import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/loadingscreen.dart';

 
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loadingscreen()
    ),
  );
}
