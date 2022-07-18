import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food.dart';
import 'package:foodage_morello/models/food.dart';

class ListFoodCard extends StatelessWidget {
  final List<Food> foodList;

  ListFoodCard({required this.foodList});

  @override
  Widget build(BuildContext context) {
    if (foodList == null) return Container();

    return ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (BuildContext inContext, int inIndex) {
          var food = foodList[inIndex];
          return FoodCard(
            food: food,
          );
        });
  }
}
