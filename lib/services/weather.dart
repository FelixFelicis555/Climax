import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:climax/networking.dart';
import 'package:climax/screens/location_screen.dart';

const apiKey = '09467ac2e9b3aa8502ff133b31fb8f0c';

class WeatherModel {
  Future<Position> getLocationData() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    print(await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high));

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    double longitude;
    double latitude;
// var weatherData;

    Position position = await getLocationData();

    latitude = position.latitude;
    longitude = position.longitude;

    NetworkHelper networkHelper = new NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
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
