import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_card.dart';
// import 'package:foodage_morello/constants/constants.dart';
// import 'package:provider/provider.dart';
// import 'dart:collection';

import 'package:foodage_morello/models/food.dart';

class FoodListProvider extends ChangeNotifier {
  // void addNewCardToTheList(FoodCard newCard) {
  //   _freezerExpiredFood.add(newCard);
  //   print('$_freezerExpiredFood added');
  //   notifyListeners();
  // }

  Food? expandedFood;

  void setExpandedFood(Food food) {
    expandedFood = food;
    notifyListeners();
  }

  void clearExpandedFood() {
    expandedFood = null;
    notifyListeners();
  }

  void deleteFood(Food food) {
    foodList.remove(food);
    notifyListeners();
  }

  void addNewFood(Food food) {
    foodList.add(food);
    notifyListeners();
  }
}
