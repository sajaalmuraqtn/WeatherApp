import 'package:flutter/material.dart';
import 'package:weather_app/widgets/hourly_forecast_item.dart';

class HourlyWeather extends StatefulWidget {
  const HourlyWeather({super.key});

  @override
  State<HourlyWeather> createState() => _HourlyWeatherState();
}

class _HourlyWeatherState extends State<HourlyWeather> {
  int selectedButton = -1;

  // 🔹 بيانات مرتبة (بدل تكرار الكود)
  final List<Map<String, dynamic>> hourlyData = [
    {"hour": 9, "temp": 18, "img": "assets/cloud.png"},
    {"hour": 12, "temp": 22, "img": "assets/cloud.png"},
    {"hour": 15, "temp": 24, "img": "assets/synny.png"},
    {"hour": 18, "temp": 20, "img": "assets/cloudy.png"},
    {"hour": 21, "temp": 17, "img": "assets/cloudy.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemCount: hourlyData.length,
            itemBuilder: (context, index) {
              final item = hourlyData[index];
      
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: selectedButton == index
                      ? const Color(0xff0FA2FD)
                      : Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedButton = index;
                  });
                },
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 150),
                  scale: selectedButton == index ? 1.1 : 1,
                  child: HourlyForecastItem(
                    hour: item["hour"],
                    temp: item["temp"],
                    imgurl: item["img"],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
