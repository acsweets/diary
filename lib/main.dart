import 'package:flutter/material.dart';
import 'common.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(
      ScreenUtilInit(designSize: const Size(414, 896), builder: (_, child) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner :false,
      title: '心情日记  ',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}