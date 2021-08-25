import 'package:flutter/material.dart';
import 'package:foodage_morello/components/rounded_button.dart';
import 'package:foodage_morello/screens/login_screen.dart';
import 'package:foodage_morello/screens/registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade100,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset('images/logo.png',
                            height: 70, color: Colors.pink // Color(0xFFce3a55),
                            ),
                      ),
                    ),
                    Text(
                      'FOODAGE',
                      style: TextStyle(
                        fontFamily: 'PatrickHand',
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        // color: Colors.pinkAccent
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  // ThemeData().copyWith(accentColor: Colors.pinkAccent),
                  Colors.teal,
                  'Login',
                  () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  Colors.teal,
                  'Registrazione',
                  () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
