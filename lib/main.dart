import 'package:diary/provider/color_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(
    MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ColorModel(),),

      ],
      child: ScreenUtilInit(designSize: const Size(414, 896), builder: (_, child) => const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner :false,
      title: '心情日记  ',
      builder: BotToastInit(),
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: const NewLoginPage(),
    );
  }
}