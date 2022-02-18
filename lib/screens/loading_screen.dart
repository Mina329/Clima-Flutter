import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getlocation();
    getData();
  }
  void getData() async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=dd8c8fff906eaeeb9523b32403cbf57b'));
    if(response.statusCode == 200){
      String data =response.body;
      var decodedData = jsonDecode(data);
      int temprature = decodedData['main']['temp'];
      double condition = decodedData['weather'][0]['id'];
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
    print(location.latitude);
    print(location.longitude);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
