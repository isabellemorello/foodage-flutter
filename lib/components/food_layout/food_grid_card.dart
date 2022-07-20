import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/bottomSheetFromFoodCard.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/constants/dialog_functions.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:foodage_morello/screens/show_single_food_screen.dart';
import 'package:provider/provider.dart';

/// GRIDCARD per la visualizzazione a GRIGLIA in Homepage
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
          margin: EdgeInsets.all(0),
          color: Colors.red.shade50,
          elevation: 1,
          shadowColor: Colors.teal[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            // height: 200,
            // width: 90,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  height: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '${food.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade600),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    food.deadlineDate != null
                        ? 'Scadenza: ${food.deadlineDate}'
                        : 'Scadenza: Nessuna',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextButton(
                    child: Icon(
                      Icons.delete,
                      size: 20,
                    ),
                    onPressed: () {
                      foodListProvider.moveFoodToTrash(food);
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

/// GRIDCARD per la visualizzazione a GRIGLIA in Cestino
class FoodTrashGridCard extends StatelessWidget {
  final Food food;

  FoodTrashGridCard({
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
          margin: EdgeInsets.all(0),
          color: Colors.red.shade50,
          elevation: 1,
          shadowColor: Colors.teal[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            // height: 200,
            // width: 90,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  height: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '${food.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade600),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    food.deadlineDate != null
                        ? 'Scadenza: ${food.deadlineDate}'
                        : 'Scadenza: Nessuna',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: Icon(
                            Icons.restart_alt,
                            size: 20,
                          ),
                          onPressed: () => kDialogToRestoreFood(
                              context, food, foodListProvider),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: Icon(
                            Icons.delete,
                            size: 20,
                          ),
                          onPressed: () => kDialogToDeleteFood(
                              context, food, foodListProvider),
                        ),
                      ),
                    ],
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
