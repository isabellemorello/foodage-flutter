import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodage_morello/screens/handler_home_screen.dart';
import 'package:foodage_morello/screens/handler_home_settings_screen.dart';
import 'package:foodage_morello/screens/labels_screen.dart';
import 'package:foodage_morello/screens/new_food_screen.dart';
import 'package:foodage_morello/screens/trash_screen.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/homepage_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/settings_screen.dart';
import 'firebase_options.dart';
import 'components/food_layout/food_list_provider.dart';
import 'screens/show_single_food_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FoodListProvider>(
      create: (context) => FoodListProvider(),
      child: MaterialApp(
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
          SettingsScreen.id: (context) => SettingsScreen(),
          TrashScreen.id: (context) => TrashScreen(),
          HandlerHomeScreen.id: (context) => HandlerHomeScreen(),
          HandlerHomeSettingsScreen.id: (context) =>
              HandlerHomeSettingsScreen(),
          ShowSingleFoodScreen.id: (context) => ShowSingleFoodScreen(),
          LablesScreen.id: (context) => LablesScreen(),
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
      ),
    );
  }
}
