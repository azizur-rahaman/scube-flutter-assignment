import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/asset_manager.dart';
import 'weather_card.dart';

class WeatherCarousel extends StatefulWidget {
  final String temperature;
  final String windSpeed;
  final String irradiation;

  const WeatherCarousel({
    super.key,
    required this.temperature,
    required this.windSpeed,
    required this.irradiation,
  });

  @override
  State<WeatherCarousel> createState() => _WeatherCarouselState();
}

class _WeatherCarouselState extends State<WeatherCarousel> {
  int _currentIndex = 0;
  Timer? _timer;

  late final List<Map<String, String>> _weatherStates;

  @override
  void initState() {
    super.initState();
    _weatherStates = [
      // State 1: 17°C (Morning / Current)
      {
        'temp': widget.temperature, // "17°C" from API/State
        'icon': AssetManager.weatherIconMorning,
        'thermometer': AssetManager.thermometerIcon17,
        'wind': widget.windSpeed,
        'irradiation': widget.irradiation,
      },
      // State 2: 30°C (Sun)
      {
        'temp': '30°C',
        'icon': AssetManager.weatherIconSun,
        'thermometer': AssetManager.thermometerIcon30,
        'wind': '26 MPH / NW', // Mock data for demo carousel
        'irradiation': '15.20 w/m²',
      },
      // State 3: 19°C (Moon)
      {
        'temp': '19°C',
        'icon': AssetManager.weatherIconMoon,
        'thermometer': AssetManager.thermometerIcon19,
        'wind': '26 MPH / NW',
        'irradiation': '15.20 w/m²',
      },
    ];

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _weatherStates.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentState = _weatherStates[_currentIndex];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: WeatherCard(
        key: ValueKey<int>(_currentIndex), // Important for animation
        mainTitle: currentState['temp']!,
        mainSubTitle: AppStrings.moduleTemperature,
        mainIconPath: currentState['thermometer']!,
        secondaryTopTitle: currentState['wind']!,
        secondaryTopSubTitle: AppStrings.windSpeedDirection,
        secondaryBottomTitle: currentState['irradiation']!,
        secondaryBottomSubTitle: AppStrings.effectiveIrradiation,
        secondaryIconPath: currentState['icon']!,
      ),
    );
  }
}
