import 'package:diary/pages/front_page.dart';
import 'package:diary/pages/guide_pages.dart';
import 'package:flutter/material.dart';
import 'common.dart';
void main() {
  runApp( ScreenUtilInit(designSize: const Size(414, 896), builder: (_, child) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner :false,
      title: '心情日记  ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   const SplashPage(),
    );
  }
}