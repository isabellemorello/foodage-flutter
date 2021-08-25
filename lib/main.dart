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
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodage',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.red.shade100,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomepageScreen.id: (context) => HomepageScreen(),
        NewFoodScreen.id: (context) => NewFoodScreen(),
      },
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('You have an error: ${snapshot.hasError}');
            return Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return WelcomeScreen();
          } else {
            return Container(
              color: Colors.teal.shade100,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
