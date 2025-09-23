import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/widgets/country_picker.dart';
import 'package:weather_app/widgets/weather_stat.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class WeatherCard extends StatefulWidget {
  final Weather weather_data;
  const WeatherCard({super.key, required this.weather_data});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late String city;
  late String country;
  late String temp;
  late String wind;
  late String humidity;
  late String clouds;
  late int condition;
  late String iconUrl;
  TextEditingController countryT = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController cityT = TextEditingController();
  void updateUi() {
    city = widget.weather_data.city;
    country = widget.weather_data.country;
    temp = widget.weather_data.temp;
    wind = widget.weather_data.wind;
    humidity = widget.weather_data.humidity;
    clouds = widget.weather_data.clouds;
    condition = widget.weather_data.condition;
    iconUrl = widget.weather_data.iconUrl;
  }

  @override
  void initState() {
    updateUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: const Color(0xB0FFFFFF), width: 0.4),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff15BDF6), Color(0xFF065FAC)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF065FAC).withOpacity(0.5),
            spreadRadius: -12.0,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: Center(
                          child: Column(
                            children: [
                              SizedBox(height: 100),
                              CountryPicker(),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('back'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).then((value) async {
                    if (value != null) {
                      final city = value['city'];
                      final state = value['state'];
                      final country = value['country'];
                       ////////// جلب الطقس للمدينة المختارة //////////
                      final url =
                          "https://api.openweathermap.org/data/2.5/weather?q=$city,$country";
                      await widget.weather_data.getWeather(url);
                    setState(() {
                      updateUi();
                    });  
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(30, 30),
                  shape: const CircleBorder(),
                  side: const BorderSide(color: Color(0xCCFFFFFF)),
                ),
                child: const Icon(Icons.more_horiz_sharp, color: Colors.white),
              ),
              Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.white, size: 20),
                  SizedBox(width: 4),
                  Text(
                    '$city',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.more_vert_outlined, color: Colors.white),
            ],
          ),
          Expanded(
            child: Image.network(
              widget.weather_data.iconUrl,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            '${(widget.weather_data.temp)}°',
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text('$country ,$city', style: TextStyle(color: Colors.white)),
          Text(
            '${DateFormat('EEEE , d MMMM').format(DateTime.now())}',
            style: TextStyle(color: Colors.white54, fontSize: 10),
          ),
          const Divider(color: Colors.white12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherStat(
                icon: Icons.wind_power_outlined,
                value: '$wind km/h',
                label: 'Wind',
              ),
              WeatherStat(
                icon: Icons.water_drop_outlined,
                value: '$humidity%',
                label: 'Humidity',
              ),
              WeatherStat(
                icon: Icons.waves,
                value: '$clouds%',
                label: 'Chance\nof rain',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*


*/
