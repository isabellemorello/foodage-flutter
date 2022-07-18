import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:foodage_morello/components/food_layout/list_food_card.dart';
import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:provider/provider.dart';

class FridgeHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
        builder: (context, foodListSections, child) {
      return Container(
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50.0),
        color: Colors.teal.shade50,
        child: ListFoodCard(
          foodList: foodList
              .where((element) => element.sectionType == SectionType.Frigo)
              .toList(),
        ),
        // child: ListView.builder(
        //     key: key,
        //     itemCount: foodListSections.listFridgeCount,
        //     itemBuilder: (BuildContext inContext, int inIndex) {
        //       return foodListSections.fridgeExpiredFood[inIndex];
        //     }),
      );
    });
  }
}
