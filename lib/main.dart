import 'package:flutter/material.dart';
import 'package:foodage_morello/models/screens_model.dart';
import 'package:foodage_morello/screens/new_food_screen.dart';
import 'package:provider/provider.dart';
import 'models/screens_model.dart';
import 'screens/welcome_screen.dart';
import 'screens/homepage_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomepageScreen.id: (context) => HomepageScreen(),
        NewFoodScreen.id: (context) => NewFoodScreen(),
      },
      home: WelcomeScreen(),
      // home: Provider<ScreenModel>.value(
      //   value: screenModel,
      //   child: Consumer<ScreenModel>(
      //     builder: (context, screenModel, child) {
      //       return screens[screenModel.currentScreenState];
      //     },
      //   ),
      // ),

      // home: Provider<ScreenModel>(
      //   create: (_) => screenModel,
      //   builder: (context, child) {
      //     return screens[context.watch<ScreenModel>().currentScreenState];
      //   },
      // ),
    );
  }
}
