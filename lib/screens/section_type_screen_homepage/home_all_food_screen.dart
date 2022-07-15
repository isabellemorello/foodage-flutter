import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food.dart';
import 'package:provider/provider.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
// import 'package:foodage_morello/models/food.dart';
// import 'package:foodage_morello/models/food_list_model.dart';

class HomeAllFoodScreen extends StatelessWidget {
  const HomeAllFoodScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListSections>(
        builder: (context, foodListSections, child) {
      return Container(
        padding: EdgeInsets.only(bottom: 30.0),
        color: Colors.teal[50],
        margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
        child: ListView.builder(
          itemCount:
              Provider.of<FoodListSections>(context).allExpiredFood.length,
          itemBuilder: (BuildContext inBuildContext, int inIndex) {
            return Provider.of<FoodListSections>(context)
                .allExpiredFood[inIndex];
          },
        ),
      );
    });
  }
}
