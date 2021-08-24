import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:foodage_morello/models/food_list_model.dart';

class HomeAllFoodScreen extends StatelessWidget {
  const HomeAllFoodScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
      child: ListView.builder(
        itemCount: foodModel.foodList.length,
        itemBuilder: (BuildContext inBuildContext, int inIndex) {
          Food food = foodModel.foodList[inIndex];

          return
              // Text('Scaduto'),
              Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Scaduto'),
                    FoodCard(
                      sectionIcon: food.sectionIcon ?? kFridgeIcon,
                      foodName: '${food.foodName}',
                      deadlineDate: '${food.deadlineDate}',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Scade oggi'),
                    FoodCard(
                      sectionIcon: food.sectionIcon ?? kFridgeIcon,
                      foodName: '${food.foodName}',
                      deadlineDate: '${food.deadlineDate}',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Scade Scade domani'),
                    FoodCard(
                      sectionIcon: kFridgeIcon,
                      foodName: 'Ciaooo',
                      deadlineDate: '22/08/2021',
                    ),
                  ],
                ),
              ),
            ],
          );
          // SizedBox(
          //   height: 30.0,
          // ),
          // Text('Scade oggi'),

          // Text('Scade domani'),
        },
      ),
    );
  }
}
