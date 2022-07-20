import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_grid_card.dart';
import 'package:foodage_morello/models/food.dart';

/// Visualizzazione a GRIGLIA in Homepage
class GridViewFoodCard extends StatelessWidget {
  final List<Food> foodList;
  GridViewFoodCard({required this.foodList});

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemCount: foodList.length,
      itemBuilder: (BuildContext inContext, int inIndex) {
        var food = foodList[inIndex];
        return FoodGridCard(food: food);
      },
    );
  }
}

/// Visualizzazione a GRIGLIA in Cestino
class GridViewTrashFoodCard extends StatelessWidget {
  final List<Food> foodList;

  GridViewTrashFoodCard({required this.foodList});

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemCount: foodList.length,
      itemBuilder: (BuildContext inContext, int inIndex) {
        var food = foodList[inIndex];
        return FoodTrashGridCard(food: food);
      },
    );
  }
}
