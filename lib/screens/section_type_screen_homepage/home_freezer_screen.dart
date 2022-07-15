import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:provider/provider.dart';

class FreezerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListSections>(
        builder: (context, foodListSections, child) {
      final FoodCard newFood = FoodCard(
        sectionIcon: kFreezerIcon,
        foodName: 'Cavolo',
        deadlineDate: '22/08/2022',
        // removeCallBack: () {
        //   final item = foodListSections.freezerExpiredFood;
        //   Provider.of<FoodListSections>(context, listen: false)
        //       .removeItem(item);
        // },
      );
      return Container(
        margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
        color: Colors.teal.shade50,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: Icon(Icons.ac_unit),
                  onPressed: () {
                    Provider.of<FoodListSections>(context, listen: false)
                        .addNewCardToTheList(newFood);
                    print('added');
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                  itemCount: foodListSections.listFreezerCount,
                  itemBuilder: (BuildContext inContext, int inIndex) {
                    return foodListSections.freezerExpiredFood[inIndex];
                  }),
            ),
          ],
        ),
      );
    });
  }
}
