import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_card.dart';
import 'package:foodage_morello/components/food_layout/list_food_card.dart';
import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:foodage_morello/models/labels.dart';
import 'package:provider/provider.dart';

class FreezerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Food food = Food(
        id: '12',
        name: 'Cucciolone',
        sectionIcon: kFreezerIcon,
        deadlineDate: '11/08/2022',
        deadlineType: 'Scadenza a lungo termine',
        labelList: [labels[3]],
        price: '1,09');

    return Consumer<FoodListProvider>(
        builder: (context, foodListSections, child) {
      return Container(
          margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50.0),
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
                      // final FoodCard newFood = FoodCard(food);

                      Provider.of<FoodListProvider>(context, listen: false)
                          .addNewFood(food);
                      for (var food in foodList) {
                        print('added ${food.name}');
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 5,
                child: ListFoodCard(
                    foodList: foodList
                        .where((element) =>
                            element.sectionType == SectionType.Freezer)
                        .toList()),
                // child: ListView.builder(
                //     itemCount: foodListSections.listFreezerCount,
                //     itemBuilder: (BuildContext inContext, int inIndex) {
                //       return foodListSections.freezerExpiredFood[inIndex];
                //     }),
              ),
            ],
          ));
    });
  }
}
