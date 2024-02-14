import 'package:bus_reservation/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Booking',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        // brightness: Brightness.dark,
      ),
      home: SearchPage(),
    );
  }
}
