import 'package:flutter/material.dart';
// import 'package:foodage_morello/components/food_layout/food.dart';
// import 'package:foodage_morello/constants/constants.dart';
// import 'package:provider/provider.dart';
// import 'dart:collection';

import 'package:foodage_morello/models/food.dart';

class FoodListSections extends ChangeNotifier {
  // void addNewCardToTheList(FoodCard newCard) {
  //   _freezerExpiredFood.add(newCard);
  //   print('$_freezerExpiredFood added');
  //   notifyListeners();
  // }

  // void removeItem(FoodCard removeCard) {
  //   _freezerExpiredFood.remove(removeCard);
  //   print('removed element from the list');
  //   notifyListeners();
  // }

  // UnmodifiableListView<FoodCard> get fridgeExpiredFood {
  //   return UnmodifiableListView(_fridgeExpiredFood);
  // }

  // int get listFridgeCount {
  //   return _fridgeExpiredFood.length;
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

// prendo tutta la lista di Food e la metto in Card
  // allList() {
  //   foodList.forEach((element) {
  //     FoodCard(
  //         sectionIcon: element.sectionIcon,
  //         foodName: element.name,
  //         deadlineDate: element.deadlineDate);
  //   });
  // }

  // List<FoodCard> allListss = allList();

  // select to show a single food

}
