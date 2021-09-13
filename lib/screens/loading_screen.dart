import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myprofile/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getlocationdata();
    super.initState();
  }

  void getlocationdata() async {
    WeatherModel weather = WeatherModel();
    var weatherdata = await weather.getlocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
