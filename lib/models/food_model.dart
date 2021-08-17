import 'package:flutter/material.dart';
import 'package:foodage_morello/components/new_food_content.dart';

class Food {
  String foodName = '';
  DateTime seadlineDate = DateTime.now();
  DeadlineType deadlineType = DeadlineType.shortTerm;
  SectionType sectionType = SectionType.Frigo;
  List<String> labelList = [];
  String shopName = '';
  String price = '';
}

class FoodsModel extends ChangeNotifier {
  int stackIndex = 0;
  List<Food> foodList = [];
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
