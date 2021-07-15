import 'package:flutter/material.dart';
import 'package:pocket_app/home.dart';
import 'constants.dart';
import 'i18n/spec.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // add this
  LocaleSettings.useDeviceLocale(); // and this
  runApp(Pocket());
}

class Pocket extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pocket',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: bgLightColor,
      ),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}


