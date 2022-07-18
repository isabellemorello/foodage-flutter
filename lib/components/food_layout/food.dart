import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
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
    return Consumer<FoodListSections>(
        builder: (context, foodListSections, child) {
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
                //! Riprovare a rimuovere una card dalla lista
                onPressed: () {
                  kFeatureNotDeveloped(context);
                  // var food = foodList.where((element) => element.id == id);
                  // foodList.remove(food);
                  // print('$food deleted');
                },
              ),
              onTap: () {
                foodListSections.setExpandedFood(food);
                Navigator.pushNamed(context, ShowSingleFoodScreen.id);
                // foodListSections.removeItem(
                //     Provider.of<FoodListSections>(context, listen: false)
                //         .removeItem(removeCard);
                // Navigator.pushNamed(context, NewFoodScreen.id);
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
