import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_app/view/welcome/welcome.dart';
import 'constants.dart';
import 'common.dart';

void main() {
  runApp(Pocket());
}

class Pocket extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor( 0xFF2c3e50, colorSwatch),
        primaryColor: lPrimaryColor,
        accentColor: lAccentColor,
        backgroundColor: lBgColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor( 0xFFbdc3c7, colorSwatch),
        primaryColor: dPrimaryColor,
        accentColor: dAccentColor,
        backgroundColor: dBgColor,
        scaffoldBackgroundColor: dBgColor,
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (light, dark) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Pocket',
        theme: light,
        darkTheme: dark,
        home: WelcomeScreen(),
      )
    );
    
  }
}


