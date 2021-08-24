import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food.dart';

class HomeAllFoodScreen extends StatelessWidget {
  const HomeAllFoodScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
      child: ListView(
        children: [
          Text('Scaduto'),
          FoodCard(
            sectionIcon: kFridgeIcon,
            foodName: 'Ciaooo',
            deadlineDate: '22/08/2021',
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('Scade oggi'),
          FoodCard(
              sectionIcon: kFreezerIcon,
              foodName: 'foodName',
              deadlineDate: '22/08/2021'),
          SizedBox(
            height: 30.0,
          ),
          Text('Scade domani'),
          FoodCard(
              sectionIcon: kDispensaIcon,
              foodName: 'foodName',
              deadlineDate: '22/08/2021'),
        ],
      ),
    );
  }
}
