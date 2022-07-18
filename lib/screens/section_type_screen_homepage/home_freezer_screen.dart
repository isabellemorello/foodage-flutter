import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/list_food_card.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:foodage_morello/models/labels.dart';
import 'package:provider/provider.dart';

class FreezerHomeScreen extends StatelessWidget {
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
      return Container(
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50.0),
        color: Colors.teal.shade50,
        child: ListFoodCard(
          foodList: foodList
              .where((element) => element.sectionType == SectionType.Freezer)
              .toList(),
        ),
      );
    });
  }
}
