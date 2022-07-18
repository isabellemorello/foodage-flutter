import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/list_food_card.dart';
import 'package:foodage_morello/components/homepage_screen/food_grid.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:provider/provider.dart';

class FreezerHomeScreen extends StatefulWidget {
  @override
  State<FreezerHomeScreen> createState() => _FreezerHomeScreenState();
}

class _FreezerHomeScreenState extends State<FreezerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Food food = Food(
    //     id: '12',
    //     name: 'Cucciolone',
    //     sectionIcon: kFreezerIcon,
    //     deadlineDate: '11/08/2022',
    //     deadlineType: 'Scadenza a lungo termine',
    //     labelList: [labels[3]],
    //     price: '1,09');

    return Consumer<FoodListProvider>(
        builder: (context, foodListProvider, child) {
      bool isList = foodListProvider.isList;
      return Container(
        margin: isList
            ? EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50.0)
            : EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 50.0),
        color: Colors.teal.shade50,
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // setState(() {
                      //   isList = !isList;
                      // });
                      Provider.of<FoodListProvider>(context, listen: false)
                          .setIsList();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isList
                            ? Icon(
                                Icons.grid_view,
                                color: Colors.black87,
                                size: 20,
                              )
                            : Icon(
                                Icons.list,
                                color: Colors.black87,
                                size: 20,
                              ),
                        isList
                            ? Text(
                                'Griglia',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              )
                            : Text(
                                'Lista',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => kFeatureNotDeveloped(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.black87,
                          size: 20,
                        ),
                        Text(
                          'Ordina per',
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: isList
                  ? ListFoodCard(
                      foodList: foodList
                          .where((element) =>
                              element.sectionType == SectionType.Freezer)
                          .toList(),
                    )
                  : GridViewFoodCard(
                      foodList: foodList
                          .where((element) =>
                              element.sectionType == SectionType.Freezer)
                          .toList(),
                    ),
            ),
          ],
        ),
      );
    });
  }
}
