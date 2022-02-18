import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';


const apikey = 'dd8c8fff906eaeeb9523b32403cbf57b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper helper = NetworkHelper(
        url: Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric'));
    var decodedData = await helper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        decodedData: decodedData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
