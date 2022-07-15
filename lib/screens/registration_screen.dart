import 'package:flutter/material.dart';
import 'package:foodage_morello/screens/homepage_screen.dart';
import 'package:foodage_morello/components/rounded_button.dart';
import 'package:foodage_morello/db/firestore_db.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';
  bool showSpinner = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'images/logo.png',
                        height: 60.0,
                        color: Colors.teal, // Color(0xFFce3a55),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'FOODAGE',
                    style: TextStyle(
                        fontFamily: 'PatrickHand',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailField,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      validator: (String? inValue) {
                        if (inValue.toString().length == 0) {
                          return 'Perfavore inserisci la tua email';
                        }
                        return null;
                      },
                      // onSaved: (value) {
                      //   this.email = value.toString();
                      // },
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Inserisci la tua email',
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: _passwordField,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      validator: (String? inValue) {
                        if (inValue.toString().length < 8) {
                          return 'La password deve essere di almeno 8 lettere';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        this.password = value.toString();
                      },
                      decoration: InputDecoration(
                        hintText: 'Inserisci la password',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                colour: Colors.teal,
                textColour: Colors.red.shade50,
                title: 'Registrati',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    print('Username: $_emailField');
                    print('Username: $_passwordField');
                  }

                  bool shouldNavigate = await FoodDBWorker()
                      .registerUser(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.pushNamed(context, HomepageScreen.id);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
