import 'dart:ui';

import 'package:weather_app/models/user_location.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/networking.dart';

class Weather {
  late String city; // اسم المدينة
  late String country; // اسم الدولة
  late String temp; // درجة الحرارة
  late String wind; // سرعة الرياح
  late String humidity; // نسبة الرطوبة
  late String clouds; // نسبة الغيوم / المطر
  late int condition; // رقم الحالة الجوية (يجي من API مثلاً)
  late String iconUrl; // رابط أيقونة الطقس

  Future<void> getWeather( String url) async {
    Map<String, dynamic> weatherInfo = await NetworkHelper(
      "$url&appid=$API_KEY&units=metric",
    ).getData();

    city = weatherInfo['name'];
    country = weatherInfo['sys']['country'];
    temp = (weatherInfo['main']['temp'] as double).toStringAsFixed(
      1,
    ); // تحويل إلى درجة مئوية مع رقم عشري واحد
    wind = weatherInfo['wind']['speed'].toString();
    humidity = weatherInfo['main']['humidity'].toString();
    clouds = weatherInfo['clouds']['all'].toString();
    condition = weatherInfo['weather'][0]['id'];
    // أجيب رابط الأيقونة
    String iconCode = weatherInfo['weather'][0]['icon'];
    iconUrl = "https://openweathermap.org/img/wn/$iconCode@2x.png";
  }

  // String? getWeatherImage(int condition) {
  //   if (condition < 300) {
  //     return 'assets/stormy.png'; // رعد
  //   } else if (condition < 600) {
  //     return 'assets/rainy.png'; // مطر
  //   } else if (condition < 700) {
  //     return 'assets/rainy.png'; // ثلج
  //   } else if (condition < 800) {
  //     return 'assets/cloudy.png'; // ضباب
  //   } else if (condition == 800) {
  //     return 'assets/sunny.png'; // مشمس
  //   } else if (condition <= 804) {
  //     return 'assets/cloudy.png'; // غائم
  //   } else {
  //     return null; // إذا ما في صورة مناسبة
  //   }
  // }
}
