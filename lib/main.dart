import 'package:flutter/material.dart';
import 'package:weather_app/screens/loadingscreen.dart';
import 'package:weather_app/screens/splashscreen.dart';

 
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen()
    ),
  );
}
