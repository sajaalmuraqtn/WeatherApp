import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key,required this.hour,required this.imgurl,required this.temp});
  final int temp ;
  final String imgurl;
  final int hour;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$temp°', style: TextStyle(color: Colors.white, fontSize: 12)),
          Expanded(
            child: Image.asset(
              imgurl,
              height: 30,
              width: 30,
            ),
          ),

          Icon(Icons.radar, color: Colors.white, size: 25),
          Text('$hour:00', style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}
