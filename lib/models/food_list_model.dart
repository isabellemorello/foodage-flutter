import 'package:flutter/material.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';

class FoodsModel extends ChangeNotifier {
  int stackIndex = 0; // ! non so se metterlo
  List<Food> foodList = [
    Food(
        foodName: '',
        deadlineDate: DateTime.september,
        sectionType: SectionType.Frigo),
  ];
  Food foodBeingEdited = Food();
  SectionType sectionType = SectionType.Frigo;

  void setStackIndex(int inStackIndex) {
    stackIndex = inStackIndex;
    notifyListeners();
  }

  void setSectionType(SectionType inSectionType) {
    sectionType = inSectionType;
    notifyListeners();
  }

  void getAllFoodList(dynamic inFoodList) async {
    foodList = await inFoodList.getAll(); // TODO: creare funzione per DB
  }
}

FoodsModel foodModel = FoodsModel();
