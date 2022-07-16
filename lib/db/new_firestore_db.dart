import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:foodage_morello/models/food.dart';

class NewFoodDBFirestore {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  /// Query a subcollection
  // Stream<List<Food>> streamFoods(UserInfo user) {
  //   var ref = _db.collection('users').doc(user.uid).collection('foods');

  //   return ref.snapshots().map(
  //       (list) => list.docs.map((doc) => Food.fromFirestore(doc)).toList());
  // }

  /// Write data
  Future<void> createFood(String foodId) {
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

    return _db
        .collection('users')
        .doc(uid)
        .collection('foods')
        .doc(foodId)
        .set({
      'foodName': foodName,
      'deadlineDate': deadlineDate,
      'deadlineType': deadlineType,
      'cookedByMe': cookedByMe,
      'sectionType': sectionType,
      'sectionIcon': sectionIcon,
      'labelList': labelList,
      'shopName': shopName,
      'price': price,
      'note': note,
    });
  }
}
