import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:provider/provider.dart';

class FridgeHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListSections>(
        builder: (context, foodListSections, child) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 20.0,
        ),
        color: Colors.teal.shade50,
        child: ListView.builder(
            key: key,
            itemCount: foodListSections.listFridgeCount,
            itemBuilder: (BuildContext inContext, int inIndex) {
              return foodListSections.fridgeExpiredFood[inIndex];
            }),
      );
    });
  }
}
