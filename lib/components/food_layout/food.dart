import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:provider/provider.dart';
import 'bottomSheetFromFoodCard.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    required this.sectionIcon,
    required this.foodName,
    required this.deadlineDate,
    // required this.deleteFunction,
  });

  final IconData sectionIcon;
  final String foodName;
  final String deadlineDate;
  // final deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListSections>(
        builder: (context, foodListSections, child) {
      return Card(
        color: Colors.red[50],
        child: Column(
          children: [
            ListTile(
              key: key,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    sectionIcon,
                    color: kActiveColorSectionType,
                    size: 30,
                  ),
                ],
              ),
              title: Text(foodName),
              subtitle: Text('Scadenza: $deadlineDate'),
              trailing: TextButton(
                child: Icon(Icons.delete),
                //! Riprovare a rimuovere una card dalla lista
                onPressed: () => kFeatureNotDeveloped(context),
              ),
              onTap: () {
                kFeatureNotDeveloped(context);
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
