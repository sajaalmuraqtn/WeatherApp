import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('25°', style: TextStyle(color: Colors.white, fontSize: 12)),
          Expanded(
            child: Image.asset(
              'assets/cloud.png',
              height: 30,
              width: 30,
            ),
          ),

          Icon(Icons.radar, color: Colors.white, size: 25),
          Text('3:00', style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}
