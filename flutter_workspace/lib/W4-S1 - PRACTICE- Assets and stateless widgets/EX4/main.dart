import 'dart:ui';
import 'package:flutter/material.dart';

class WeatherForecast extends StatelessWidget {
  final String weatherCondition;
  final int minTemperature;
  final int maxTemperature;
  final String dayOfWeek;

  const WeatherForecast({
    super.key,
    required this.weatherCondition,
    required this.minTemperature,
    required this.maxTemperature,
    required this.dayOfWeek,
  });

  Color getBackgroundColor() {
    switch (weatherCondition) {
      case 'Sunny':
        return Colors.yellow[200]!;
      case 'Rainy':
        return Colors.blue[200]!;
      case 'Cloudy':
        return Colors.grey[300]!;
      case 'Snowy':
        return Colors.blue[100]!;
      default:
        return Colors.grey[200]!;
    }
  }

  IconData getIconData() {
    switch (weatherCondition) {
      case 'Sunny':
        return Icons.sunny;
      case 'Rainy':
        return Icons.cloud_circle;
      case 'Cloudy':
        return Icons.cloud;
      case 'Snowy':
        return Icons.ac_unit;
      default:
        return Icons.cloud;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: getBackgroundColor(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            dayOfWeek,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(
            getIconData(),
            size: 40,
            color: Colors.black,
          ),
          Text(
            '$minTemperature° - $maxTemperature°',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Forecast'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherForecast(
                weatherCondition: 'Sunny',
                minTemperature: 15,
                maxTemperature: 25,
                dayOfWeek: 'Mon',
              ),
              SizedBox(
                height: 5,
              ),
              WeatherForecast(
                weatherCondition: 'Rainy',
                minTemperature: 10,
                maxTemperature: 18,
                dayOfWeek: 'Tue',
              ),

              WeatherForecast(
                weatherCondition: 'Snowy',
                minTemperature: 15,
                maxTemperature: 25,
                dayOfWeek: 'Wed',
              ),

              WeatherForecast(
                weatherCondition: 'Cloudy',
                minTemperature: 12,
                maxTemperature: 20,
                dayOfWeek: 'Thu',
              ),

              WeatherForecast(
                weatherCondition: 'Cloudy',
                minTemperature: 10,
                maxTemperature: 25,
                dayOfWeek: 'Fri',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
