import 'package:flutter/material.dart';
import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';

class Food {
  Food(
      {this.foodName = '',
      this.deadlineDate,
      this.sectionType = SectionType.Frigo});

  String foodName;
  var deadlineDate;
  DeadlineType deadlineType = DeadlineType.shortTerm;
  SectionType sectionType;
  List<String> labelList = [];
  String shopName = '';
  String price = '';
}
