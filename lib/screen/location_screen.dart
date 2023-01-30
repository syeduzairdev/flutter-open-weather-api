import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../model/weather_model.dart';
import '../services/location_service/get_user_current_location.dart';
import '../services/weather_service/weather_service.dart';

class MyCurrentLocationScreen extends StatefulWidget {
  const MyCurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _MyCurrentLocationScreenState createState() =>
      _MyCurrentLocationScreenState();
}

class _MyCurrentLocationScreenState extends State<MyCurrentLocationScreen> {
  LocationData? _currentLocation;
  WeatherModel? _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      _currentLocation =
          await LocationService.instance.getCurrentLocation(context);
      _currentAddress = await WeatherService.instance.getWheather(
          _currentLocation!.latitude!, _currentLocation!.longitude!);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentLocation != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Latitude: ${_currentLocation!.latitude}\nLongitude: ${_currentLocation!.longitude}'),
                  Text('Address: ${_currentAddress!.sys!.country}'),
                ],
              )
            : InkWell(
                onTap: () => _getCurrentLocation(),
                child: const Text('Get Location')),
      ),
    );
  }
}
