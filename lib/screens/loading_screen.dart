import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getlocation();
  }
  void getlocation() async{
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();}
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low );
    print( position);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
