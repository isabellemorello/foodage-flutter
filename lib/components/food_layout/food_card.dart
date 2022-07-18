import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:provider/provider.dart';
import 'bottomSheetFromFoodCard.dart';
import 'package:foodage_morello/screens/show_single_food_screen.dart';
import 'package:foodage_morello/models/food.dart';

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
              subtitle: Text('Scadenza: ${food.deadlineDate}'),
              trailing: TextButton(
                child: Icon(Icons.delete),
                onPressed: () {
                  foodListProvider.deleteFood(food);
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
