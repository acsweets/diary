import 'package:diary/pages/front_page.dart';
import 'package:diary/pages/guide_pages.dart';
import 'package:flutter/material.dart';
import 'package:intl_utils/intl_utils.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '心情日记',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   SplashPage(),
    );
  }
}