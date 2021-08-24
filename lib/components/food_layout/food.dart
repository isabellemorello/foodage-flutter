import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/screens/new_food_screen.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    required this.sectionIcon,
    required this.foodName,
    required this.deadlineDate,
  });

  final IconData sectionIcon;
  final String foodName;
  final String deadlineDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
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
            trailing: Icon(Icons.delete),
            onTap: () {
              Navigator.pushNamed(context, NewFoodScreen.id);
            },
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        // TODO: fare una lista di card
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.photo),
                            title: Text('take a picture'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.photo),
                            title: Text('from the gallery'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // Text(
          //   'Scadenza: 22/08/2021',
          //   textAlign: TextAlign.right,
          //   style: TextStyle(
          //     fontSize: 12,
          //   ),
          // ),
        ],
      ),
    );
  }
}
