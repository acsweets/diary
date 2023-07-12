import 'package:diary/provider/color_model.dart';
import 'package:diary/provider/language_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'common.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(
    MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ColorModel(),),
        ChangeNotifierProvider(create: (_) => LanguageModel(),),
      ],
      child: ScreenUtilInit(designSize: const Size(414, 896), builder: (_, child) => const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: AppLocalizations.supportedLocales[1],
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