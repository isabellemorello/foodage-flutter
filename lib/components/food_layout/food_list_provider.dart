import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';

import 'package:foodage_morello/models/food.dart';

class FoodListProvider extends ChangeNotifier {
  // void addNewCardToTheList(FoodCard newCard) {
  //   _freezerExpiredFood.add(newCard);
  //   print('$_freezerExpiredFood added');
  //   notifyListeners();
  // }

  Food? expandedFood;
  SectionType? sectionType;
  bool isList = true;

  void setExpandedFood(Food food) {
    expandedFood = food;
    notifyListeners();
  }

  void setIsList() {
    isList = !isList;
    notifyListeners();
  }

  // void isListFunction(bool inIsList) {
  //   setIsList(inIsList);
  //   notifyListeners();
  // }

  void setSectionType(SectionType inSectionType) {
    sectionType = inSectionType;
    notifyListeners();
  }

  void setSectionIcon(Food food) {
    if (food.sectionType == SectionType.Frigo) {
      food.sectionIcon = kFridgeIcon;
    } else if (food.sectionType == SectionType.Freezer) {
      food.sectionIcon = kFreezerIcon;
    } else if (food.sectionType == SectionType.Dispensa) {
      food.sectionIcon = kDispensaIcon;
    }
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
