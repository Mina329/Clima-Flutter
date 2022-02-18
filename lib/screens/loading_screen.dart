import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    getlocation();
  }
  void getData() async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey'));
    if(response.statusCode == 200){
      String data =response.body;
      var decodedData = jsonDecode(data);
      double temprature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
      print(temprature);
      print(condition);
      print(cityName);
    }else{
      print(response.statusCode);
    }
  }
  void getlocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
