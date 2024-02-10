import 'package:sky_scope/services/location.dart';
import 'package:sky_scope/services/networking.dart';

const apiKey = 'c1dded18e3741751cb29a0c5a29510a5';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '🌧';
    } else if (condition < 700) {
      return '❄️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍♂️';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Time for some 🏊‍♂️';
    } else if (temp > 20) {
      return 'Grab your 🕶️ and hit the ☀️';
    } else if (temp < 10) {
      return 'Get ready to build a ⛄';
    } else {
      return 'Perfect weather for a 🚶‍♂️';
    }
  }

}