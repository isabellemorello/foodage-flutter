import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodage_morello/screens/homepage_screen.dart';

class FoodDBWorker {
  final auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final firebaseInitializeApp = Firebase.initializeApp();

  User? loggedInUser;
  // String? email;
  // String? password;

  // Registrazione utente
  void registrateUser(
      BuildContext inContext, String email, String password) async {
    final newUser = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (newUser != null) {
      Navigator.pushNamed(inContext, HomepageScreen.id);
    }
  }

  // Utente fa login
  void loginUser(BuildContext inContext, String email, String password) async {
    final user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (user != null) {
      Navigator.pushNamed(inContext, HomepageScreen.id);
    }
  }

  // Utente loggato
  void getCurrentUser(String email) async {
    try {
      final user = await auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }
}
