import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:foodage_morello/components/food_layout/list_food_card.dart';
import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:provider/provider.dart';

class DispensaHomeScreen extends StatefulWidget {
  @override
  State<DispensaHomeScreen> createState() => _DispensaHomeScreenState();
}

class _DispensaHomeScreenState extends State<DispensaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListSections>(
      builder: (context, foodListSections, child) {
        return Container(
          margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
          color: Colors.teal.shade50,
          child: ListFoodCard(
            foodList: foodList
                .where((element) => element.sectionType == SectionType.Dispensa)
                .toList(),
          ),
          // child: ListView.builder(
          //     itemCount: foodListSections.listDispensaCount,
          //     itemBuilder: (BuildContext inContext, int inIndex) {
          //       return foodListSections.dispensaExpiredFood[inIndex];
          //     }),
        );
      },
    );
  }
}
