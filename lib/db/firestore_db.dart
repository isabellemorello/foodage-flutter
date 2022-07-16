import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodage_morello/screens/welcome_screen.dart';
import 'package:foodage_morello/models/food.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class FoodDBWorker {
  User? user;

  FoodDBWorker() {
    _auth.userChanges().listen((event) => user = event);
  }
  // FoodDBWorker._();
  // static final FoodDBWorker foodDBWorker = FoodDBWorker._();

  // User? loggedInUser;
  // String? email;
  // String? password;
  Food food = Food();

  Future<bool> registerUser(String email, String password) async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      return user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Questa password è debole.');
      } else if (e.code == 'email-already-in-use') {
        print('Esiste già un account con questa email.');
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

// Login
  Future<bool> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // // Registrazione utente
  // Future<bool> registrateUser(
  //     BuildContext inContext, String email, String password) async {
  //   try {
  //     // final newUser =
  //     await auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'email-already-in-use') {
  //       print('Esiste già un account per questa email');
  //     }
  //     return false;
  //   } catch (e) {
  //     print(e.toString());
  //     return false;
  //   }

  //   // if (newUser != null) {
  //   //   Navigator.pushNamed(inContext, HomepageScreen.id);
  //   // }
  // }

  // // Utente fa login
  // void loginUser(BuildContext inContext, String email, String password) async {
  //   final user =
  //       await auth.signInWithEmailAndPassword(email: email, password: password);
  //   if (user != null) {
  //     Navigator.pushNamed(inContext, HomepageScreen.id);
  //   }
  // }

  // TODO! Da rivedere perché non funziona
  // Utente loggato
  void getCurrentUser(User loggedInUser) {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // Log Out
  void logOutUser(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushNamed(context, WelcomeScreen.id);
  }

  // Creare un food
  Future newFood(Food inFood) async {
    // String? currentUser;
    String? foodName;
    String? deadlineDate;
    String? deadlineType;
    bool? cookedByMe;
    String? sectionType;
    String? sectionIcon;
    List<String>? labelList;
    String? shopName;
    String? price;
    String? note;
    await _firestore.collection('foods').add(
      {
        // '${inFood.currentUser}': currentUser,
        '${inFood.name}': foodName,
        '${inFood.deadlineDate}': deadlineDate,
        '${inFood.deadlineType}': deadlineType,
        '${inFood.cookedByMe}': cookedByMe,
        '${inFood.sectionType}': sectionType,
        '${inFood.sectionIcon}': sectionIcon,
        '${inFood.labelList}': labelList,
        '${inFood.shopName}': shopName,
        '${inFood.price}': price,
        '${inFood.note}': note,
        // '${foodsModel.foodBeingEdited?.currentUser}': currentUser,
        // '${foodsModel.foodBeingEdited?.foodName}': foodName,
        // '${foodsModel.foodBeingEdited?.deadlineDate}': deadlineDate,
        // '${foodsModel.foodBeingEdited?.deadlineType}': deadlineType,
        // '${foodsModel.foodBeingEdited?.cookedByMe}': cookedByMe,
        // '${foodsModel.foodBeingEdited?.sectionType}': sectionType,
        // '${foodsModel.foodBeingEdited?.sectionIcon}': sectionIcon,
        // '${foodsModel.foodBeingEdited?.labelList}': labelList,
        // '${foodsModel.foodBeingEdited?.shopName}': shopName,
        // '${foodsModel.foodBeingEdited?.price}': price,
        // '${foodsModel.foodBeingEdited?.note}': note,
      },
    );
  }

  // Creare food - new version
  Future<bool> addFood(String id, Food inFood) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      // String? currentUser;
      String? foodName;
      String? deadlineDate;
      String? deadlineType;
      bool? cookedByMe;
      String? sectionType;
      String? sectionIcon;
      List<String>? labelList;
      String? shopName;
      String? price;
      String? note;
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('foods')
          .doc(id);
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        if (!snapshot.exists) {
          documentReference.set({
            // '${inFood.currentUser}': currentUser,
            '${inFood.name}': foodName,
            '${inFood.deadlineDate}': deadlineDate,
            '${inFood.deadlineType}': deadlineType,
            '${inFood.cookedByMe}': cookedByMe,
            '${inFood.sectionType}': sectionType,
            '${inFood.sectionIcon}': sectionIcon,
            '${inFood.labelList}': labelList,
            '${inFood.shopName}': shopName,
            '${inFood.price}': price,
            '${inFood.note}': note,
          });
          return true;
        }
        // ? versione originale, ma che non funziona
        // double newAmount = snapshot.data()['Amount'] + value;

        // ! funzione mia, che forse funziona
        Map<String, dynamic> dataFood = snapshot.data() as Map<String, dynamic>;

        String newFoodName = dataFood['foodName'] + inFood.name;
        String newDeadlineDate = dataFood['deadlineDate'] + inFood.deadlineDate;
        String newDeadlineType = dataFood['deadlineType'] + inFood.deadlineType;
        bool newCookedByMe = dataFood['cookedByMe'] + inFood.cookedByMe;
        String newSectionType = dataFood['sectionType'] + inFood.sectionType;
        List<String> newLabelList = dataFood['labelList'] + inFood.labelList;
        String newShopName = dataFood['shopName'] + inFood.shopName;
        String newPrice = dataFood['price'] + inFood.price;
        String newNote = dataFood['note'] + inFood.note;

        transaction.update(documentReference, {
          'Nome prodotto': newFoodName,
          'Scadenza': newDeadlineDate,
          'Tipologia di scadenza': newDeadlineType,
          'Cucinato da me': newCookedByMe,
          'Sezione': newSectionType,
          'Etichette': newLabelList,
          'Negozio': newShopName,
          'Prezzo': newPrice,
          'Note': newNote,
        });
        return true;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // Modificare un food
  Future updateFood(Food inFood) async {
    await _firestore.collection('foods').doc().update(foodToMap(inFood));
  }

  Map<String, dynamic> foodToMap(Food inFood) {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['foodName'] = inFood.name;
    map['deadlineDate'] = inFood.deadlineDate;
    map['deadlineType'] = inFood.deadlineType;
    map['cookedByMe'] = inFood.cookedByMe;
    map['deadlineType'] = inFood.deadlineType;
    map['labelList'] = inFood.labelList;
    map['shopName'] = inFood.shopName;
    map['price'] = inFood.price;
    map['note'] = inFood.note;
    return map;
  }

  // Ottenere l'intera lista di food
  // Future<Food> getAllFood() async {}

  // Ottenere un singolo food
  // Future<Food> getFood(String inEmail) async {
  //   var rec = await _firestore.collection('foods').doc(auth.currentUser.uid);
  // }

  Food foodFromMap(Map inMap) {
    Food food = Food(
      // currentUser: inMap['currentUser'],
      name: inMap['foodName'],
      deadlineDate: inMap['deadlineDate'],
      deadlineType: inMap['deadlineType'],
      cookedByMe: inMap['cookedByMe'],
      sectionType: inMap['sectionType'],
      sectionIcon: inMap['sectionIcon'],
      labelList: inMap['labelList'],
      shopName: inMap['shopName'],
      price: inMap['price'],
      note: inMap['note'],
    );

    return food;
  }

  // Ottenere la lista di Frigo, Freezer o Dispensa

}
