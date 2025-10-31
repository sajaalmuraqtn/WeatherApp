import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

// تعريف الألوان (افترض وجودها كثوابت عامة)
const Color kPrimaryColor = Color(0xFF2B2B4F); // البنفسجي الداكن
const Color kSecondaryColor = Color(  0xFF065FAC )  ;

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ويدجت اختيار الدولة/الولاية/المدينة
          SelectState(
            onCountryChanged: (value) {
              setState(() {
                countryValue = value;
              });
            },
            onStateChanged: (value) {
              setState(() {
                stateValue = value;
              });
            },
            onCityChanged: (value) {
              setState(() {
                cityValue = value;
              });
            },
            
            style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16
            ),
            
            
          ),
          
         Spacer(),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (cityValue.isNotEmpty && countryValue.isNotEmpty) {
                    Navigator.pop(context, {
                      'country': countryValue,
                      'state': stateValue,
                      'city': cityValue,
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a Country and City."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 48, 157, 253),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
            
                child: const Text(
                  'GET WEATHER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}