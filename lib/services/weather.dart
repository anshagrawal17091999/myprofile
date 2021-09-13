import 'package:myprofile/services/location.dart';
import 'package:myprofile/services/networking.dart';

const apikey = '5ed910d94b7e3676bab61dfc6d94b74c';

class WeatherModel {


  Future<dynamic> getcityweather(String cityname) async {
    var url = 'http://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric';
    Networking networkcity = Networking(url);
    var weatherdata = await networkcity.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    Locationservice location = Locationservice();
    await location.getcurrentlocation();
    Networking networking = Networking(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherdata = await networking.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
