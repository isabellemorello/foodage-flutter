import 'package:flutter/material.dart';
import 'package:foodage_morello/screens/homepage_screen.dart';
import 'package:foodage_morello/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      //TODO: Aggiungere per l'animazione dello spinner di caricamento:
      //         body: ModalProgressHUD(
      //         inAsyncCall: showSpinner,
      //         child: Padding(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
                      child: Image.asset('images/logo3.png',
                          height: 60.0, color: Colors.pink // Color(0xFFce3a55),
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
                      // color: Colors.pinkAccent
                    ),
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
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: true,
                      validator: (String? inValue) {
                        if (inValue.toString().length == 0) {
                          return 'Perfavore inserisci la tua email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        this.email = value.toString();
                      },
                      decoration: InputDecoration(
                        hintText: 'Inserisci la tua email',
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
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
                      decoration:
                          InputDecoration(hintText: 'Inserisci la password'),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    RoundedButton(
                      colour: Colors.teal,
                      title: 'Log in',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print('Username: $email');
                          print('Username: $password');
                        }

                        try {
                          setState(() {
                            showSpinner = true;
                          });

                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user == null) {
                            throw new Exception('user not exist');
                          }
                          Navigator.pushNamed(context, HomepageScreen.id);

                          Future.delayed(Duration(seconds: 3), () {
                            setState(() {
                              showSpinner = false;
                            });
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
