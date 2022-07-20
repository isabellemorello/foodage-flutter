import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/constants/dialog_functions.dart';
import 'package:provider/provider.dart';
import 'bottomSheetFromFoodCard.dart';
import 'package:foodage_morello/screens/show_single_food_screen.dart';
import 'package:foodage_morello/models/food.dart';

/// FOODCARD per la visualizzazione a LISTA in Homepage
class FoodCard extends StatelessWidget {
  final Food food;
  FoodCard({
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
        builder: (context, foodListProvider, child) {
      return Card(
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.red[50],
        shadowColor: Colors.teal[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ListTile(
              key: key,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.red[100],
                    child: Icon(
                      food.sectionIcon,
                      color: kActiveColorSectionType,
                      size: 30,
                    ),
                  ),
                ],
              ),
              title: Text(
                food.name.toString(),
                style: TextStyle(color: Colors.teal[600]),
              ),
              subtitle: food.deadlineDate != null
                  ? Text('Scadenza: ${food.deadlineDate}')
                  : Text('Scadenza: Nessuna'),
              trailing: TextButton(
                child: Icon(Icons.delete),
                onPressed: () {
                  foodListProvider.moveFoodToTrash(food);
                  print('${food.id} deleted');
                },
              ),
              onTap: () {
                foodListProvider.setExpandedFood(food);
                Navigator.pushNamed(context, ShowSingleFoodScreen.id);
              },
              onLongPress: () {
                bottomSheetFromFoodCard(context);
              },
            ),
          ],
        ),
      );
    });
  }
}

/// FOODCARD per la visualizzazione a LISTA in Cestino
class TrashFoodCard extends StatelessWidget {
  final Food food;

  TrashFoodCard({
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
        builder: (context, foodListProvider, child) {
      return Card(
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.red[50],
        shadowColor: Colors.teal[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ListTile(
              key: key,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.red[100],
                    child: Icon(
                      food.sectionIcon,
                      color: kActiveColorSectionType,
                      size: 30,
                    ),
                  ),
                ],
              ),
              title: Text(
                food.name.toString(),
                style: TextStyle(color: Colors.teal[600]),
              ),
              subtitle: food.deadlineDate != null
                  ? Text('Scadenza: ${food.deadlineDate}')
                  : Text('Scadenza: Nessuna'),
              trailing: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      child: Icon(
                        Icons.restart_alt,
                        size: 20,
                      ),
                      onPressed: () =>
                          kDialogToRestoreFood(context, food, foodListProvider),
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      child: Icon(
                        Icons.delete,
                        size: 20,
                      ),
                      onPressed: () =>
                          kDialogToDeleteFood(context, food, foodListProvider),
                    ),
                  ),
                ],
              ),
              onTap: () {
                foodListProvider.setExpandedFood(food);
                Navigator.pushNamed(context, ShowSingleFoodScreen.id);
              },
              onLongPress: () => bottomSheetFromFoodCard(context),
            ),
          ],
        ),
      );
    });
  }
}
