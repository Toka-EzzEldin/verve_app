import 'package:flutter/material.dart';
import 'package:verve/features/Home/home_page.dart';
import 'package:verve/features/Home/login_page.dart';
import 'package:verve/features/Home/register.dart';
import 'package:verve/features/cart/cart.dart';
import 'package:verve/features/favorite/favorite_page.dart';
import 'package:verve/features/not_found/not_found.dart';
import 'package:verve/main_screen.dart';
import 'package:verve/splash/splash.dart';

class VerveApp extends StatelessWidget {
  const VerveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const NotFoundPage()),
      routes: {
       "/": (context) => LoginPage(),
        "main": (context) => MainScreen(),
        "splash": (context) => SplashPage(),
        "register": (context) => RegisterPage(),
        //     "profile": (context) => ProfilePage(),
      },
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurpleAccent,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.deepPurpleAccent,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
