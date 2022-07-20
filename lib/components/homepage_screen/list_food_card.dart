import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_card.dart';
import 'package:foodage_morello/models/food.dart';

/// Visualizzazione a LISTA in Homepage
class ListFoodCard extends StatelessWidget {
  final List<Food> foodList;

  ListFoodCard({required this.foodList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: foodList.length,
        itemBuilder: (BuildContext inContext, int inIndex) {
          var food = foodList[inIndex];
          return FoodCard(
            food: food,
          );
        });
  }
}

/// Visualizzazione a LISTA in Cestino
class ListTrashFoodCard extends StatelessWidget {
  final List<Food> foodList;

  ListTrashFoodCard({required this.foodList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: foodList.length,
        itemBuilder: (BuildContext inContext, int inIndex) {
          var food = foodList[inIndex];
          return TrashFoodCard(
            food: food,
          );
        });
  }
}
