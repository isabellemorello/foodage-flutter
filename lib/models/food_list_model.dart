import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';

class FoodsModel extends ChangeNotifier {
  int stackIndex = 0; // ! non so se metterlo

  List<Food> foodList = [];
  Food? foodBeingEdited;
  String? sectionType;
  IconData? sectionIcon;

  void setStackIndex(int inStackIndex) {
    stackIndex = inStackIndex;
    notifyListeners();
  }

  void setSectionType(String inSectionType) {
    sectionType = inSectionType;
    notifyListeners();
  }

  void getAllFoodList(dynamic inFoodList) async {
    foodList = await inFoodList.getAll(); // TODO: creare funzione per DB
    notifyListeners();
  }

  void setSectionIcon(IconData inSectionIcon) {
    if (sectionType == SectionType.Frigo.toString()) {
      sectionIcon = kFridgeIcon;
    } else if (sectionType == SectionType.Freezer.toString()) {
      sectionIcon = kFreezerIcon;
    } else {
      sectionIcon = kDispensaIcon;
    }
    sectionIcon = inSectionIcon;
    notifyListeners();
  }
}

FoodsModel foodsModel = FoodsModel();
