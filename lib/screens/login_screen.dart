import 'package:flutter/material.dart';
import 'package:foodage_morello/screens/homepage_screen.dart';
import 'package:foodage_morello/components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  //final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      //TODO: Aggiungere per l'animazione dello spinner di caricamento:
      //         body: ModalProgressHUD(
      //         inAsyncCall: showSpinner,
      //         child: Padding(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Flexible(
            //   child: Hero(
            //     tag: 'logo',
            //     child: Container(
            //       height: 200.0,
            //       child: Image.asset('images/nameLogo.png'),
            //     ),
            //   ),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset('images/logo.png',
                        height: 70.0, color: Colors.pink // Color(0xFFce3a55),
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
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: true,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(hintText: 'Enter your email.'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(hintText: 'Enter your password.'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(Colors.teal, 'Log in', () {
              //TODO:implementare Firebase Login + Navigator verso l'Homepage
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
