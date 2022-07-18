import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/bottomSheetFromFoodCard.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodage_morello/screens/show_single_food_screen.dart';
import 'package:foodage_morello/models/food.dart';

class FoodGridCard extends StatelessWidget {
  final Food food;

  FoodGridCard({
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
        builder: (context, foodListProvider, child) {
      return TextButton(
        onPressed: () {
          foodListProvider.setExpandedFood(food);
          Navigator.pushNamed(context, ShowSingleFoodScreen.id);
        },
        onLongPress: () {
          bottomSheetFromFoodCard(context);
        },
        child: Card(
          color: Colors.red.shade50,
          elevation: 1,
          shadowColor: Colors.teal[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            // height: 200,
            width: 140,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: CircleAvatar(
                    backgroundColor: Colors.red.shade100,
                    child: Icon(food.sectionIcon),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '${food.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    food.deadlineDate != null
                        ? 'Scadenza: ${food.deadlineDate}'
                        : 'Scadenza: Nessuna',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    child: Icon(Icons.delete),
                    onPressed: () {
                      foodListProvider.deleteFood(food);
                      print('${food.id} deleted');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class GridViewFoodCard extends StatelessWidget {
  final List<Food> foodList;

  GridViewFoodCard({required this.foodList});

  Widget build(BuildContext context) {
    if (foodList == null) return Container();

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
