import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:provider/provider.dart';

class DispensaHomeScreen extends StatefulWidget {
  @override
  State<DispensaHomeScreen> createState() => _DispensaHomeScreenState();
}

class _DispensaHomeScreenState extends State<DispensaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListSections>(
      builder: (context, foodListSections, child) {
        return Container(
          margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
          color: Colors.teal.shade50,
          child: ListView.builder(
              itemCount: foodListSections.listDispensaCount,
              itemBuilder: (BuildContext inContext, int inIndex) {
                return foodListSections.dispensaExpiredFood[inIndex];
              }),
        );
      },
    );
  }
}
