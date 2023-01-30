import 'package:flutter/material.dart';
import 'package:get_location/screen/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Current Location',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyCurrentLocationScreen());
  }
}
