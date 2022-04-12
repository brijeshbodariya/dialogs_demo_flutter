import 'package:dialogs_demo_flutter/Constant/constant.dart';
import 'package:dialogs_demo_flutter/Screens/home_screen.dart';
import 'package:dialogs_demo_flutter/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    title: 'FluterBottomNavigationView',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      indicatorColor: Colors.grey,
      toggleableActiveColor: Colors.white,
      highlightColor: Colors.grey,
      bottomAppBarColor: Colors.black,
      primaryColor: const Color(0xFFffffff),
      primaryColorDark: const Color(0x00ffffff),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    ),
    home: const SplashScreen(),
    routes: <String, WidgetBuilder>{
      homeScreen: (BuildContext context) => const HomeScreen(),
      animatedScreen: (BuildContext context) => const SplashScreen(),
    },
  ));
}
