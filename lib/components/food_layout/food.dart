import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/models/screens_model.dart';
import 'package:foodage_morello/screens/new_food_screen.dart';
import 'package:provider/provider.dart';
import 'package:foodage_morello/constants/constants.dart';

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
              trailing: Icon(Icons.delete),
              onTap: () {
                //! Riprovare a rimuovere una card dalla lista
                // foodListSections.removeItem(
                //     Provider.of<FoodListSections>(context, listen: false)
                //         .removeItem(removeCard);
                // Navigator.pushNamed(context, NewFoodScreen.id);
              },
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2 + 30.0,
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      color: Color(0xff676f6f),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 20.0,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.teal[600],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // shrinkWrap: true,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Aggiungi in'.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.teal.shade50,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.teal.shade50,
                                        ),
                                        Text(
                                          'Fatto',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.teal.shade50),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            kBuildMenuItem(
                                text: 'Scaduto',
                                icon: Icons.sentiment_very_dissatisfied,
                                onClicked: () {
                                  kFeatureNotDeveloped(context);
                                  // Navigator.of(context).pop();
                                }),
                            kBuildMenuItem(
                                text: 'Preferiti',
                                icon: Icons.star,
                                onClicked: () {
                                  kFeatureNotDeveloped(context);
                                  // Navigator.of(context).pop();
                                }),
                            kBuildMenuItem(
                                text: 'Spesa',
                                icon: Icons.shopping_cart_sharp,
                                onClicked: () {
                                  kFeatureNotDeveloped(context);
                                  // Navigator.of(context).pop();
                                }),
                            kBuildMenuItem(
                                text: 'Cucinato da me',
                                icon: Icons.restaurant,
                                onClicked: () {
                                  kFeatureNotDeveloped(context);
                                  // Navigator.of(context).pop();
                                }),
                            kBuildMenuItem(
                                text: 'Cestino',
                                icon: Icons.delete_sharp,
                                onClicked: () {
                                  kFeatureNotDeveloped(context);
                                  // Navigator.of(context).pop();
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
