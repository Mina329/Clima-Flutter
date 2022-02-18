import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apikey = 'dd8c8fff906eaeeb9523b32403cbf57b';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude  = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper helper =  NetworkHelper(url:     Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey'));
    var decodedData = await helper.getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
