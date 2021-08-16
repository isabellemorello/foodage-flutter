import 'package:flutter/material.dart';
import 'package:foodage_morello/components/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  // Firebase.initializeApp();
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  //bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 150.0,
                  child: Image.asset('images/nameLogo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
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
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(Colors.lightBlue, 'Register', () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
