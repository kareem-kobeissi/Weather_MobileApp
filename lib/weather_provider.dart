import 'package:flutter/cupertino.dart';
import 'package:weather_app/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;


  WeatherModel? get weatherData => _weatherData;

String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }
}
