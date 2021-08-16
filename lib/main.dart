import 'package:flutter/material.dart';
import 'package:foodage_morello/screens/new_food_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/homepage_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodage',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.greenAccent,
      ),
      initialRoute: HomepageScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomepageScreen.id: (context) => HomepageScreen(),
        NewFoodScreen.id: (context) => NewFoodScreen(),
      },
      home: WelcomeScreen(),
    );
  }
}
