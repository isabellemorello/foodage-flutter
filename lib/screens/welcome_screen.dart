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
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/nameLogo.png',
                  height: 60.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  Colors.blue,
                  'Login',
                  () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  Colors.blue,
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
