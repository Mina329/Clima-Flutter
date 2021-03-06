
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'dd8c8fff906eaeeb9523b32403cbf57b';
const openweatherurl ='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getcityweather(String cityName) async{
    NetworkHelper helper = NetworkHelper(url: Uri.parse('$openweatherurl?q=$cityName&appid=$apikey&units=metric'));
    var decodedData = await helper.getData();
    return decodedData;
  }


  Future<dynamic> getweatherdate() async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper helper = NetworkHelper(
        url: Uri.parse(
            '$openweatherurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric'));
    var decodedData = await helper.getData();
    return decodedData;
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
