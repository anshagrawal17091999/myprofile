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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
