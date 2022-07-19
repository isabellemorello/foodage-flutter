import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/models/labels.dart';
import 'package:provider/provider.dart';

class ShowSingleFoodScreen extends StatelessWidget {
  static const String id = 'show_single_food_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
        builder: (context, foodListProvider, child) {
      return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          leading: TextButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  'Indietro',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              foodListProvider.expandedFood?.name ?? '',
            ),
          ),
          actions: [
            TextButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mode,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(
                    'Modifica',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                kFeatureNotDeveloped(context);
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.teal.shade50,
          padding: EdgeInsets.only(top: 20, right: 30, left: 30),
          child: ListView(
            // shrinkWrap: true,
            children: [
              CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 40,
                child: Icon(
                  foodListProvider.expandedFood!.sectionIcon,
                  size: 50,
                  color: Colors.red.shade100,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Data di scadenza',
                      style: kTitleSmallerTextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        foodListProvider.expandedFood?.deadlineDate ?? '',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  // Text('foodListSections.freezerExpiredFood[0].deadlineDate'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Quantità',
                      style: kTitleSmallerTextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        foodListProvider.expandedFood?.quantity ?? '',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  // Text('foodListSections.freezerExpiredFood[0].deadlineDate'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Tipo di scadenza',
                      style: kTitleSmallerTextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        foodListProvider.expandedFood?.deadlineType
                                .toString() ??
                            '',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Cucinato da me',
                      style: kTitleSmallerTextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        foodListProvider.expandedFood?.cookedByMe.toString() ??
                            '',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Sezione',
                      style: kTitleSmallerTextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        Provider.of<FoodListProvider>(context, listen: false)
                            .setSectionTypeString(
                                foodListProvider.expandedFood!)
                            .toString(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Etichette',
                    style: kTitleSmallerTextStyle(),
                    textAlign: TextAlign.left,
                  ),

                  // foodListProvider.expandedFood!.labelList.forEach((label) {
                  LabelChips(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Negozio',
                      style: kTitleSmallerTextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        foodListProvider.expandedFood!.shopName != null
                            ? foodListProvider.expandedFood!.shopName.toString()
                            : '🛒',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prezzo',
                    style: kTitleSmallerTextStyle(),
                  ),
                  Container(
                    child: Text(
                      foodListProvider.expandedFood!.price != null
                          ? foodListProvider.expandedFood!.price.toString()
                          : '💰',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Note',
                    style: kTitleSmallerTextStyle(),
                  ),
                  Container(
                    child: Text(
                      foodListProvider.expandedFood!.note != null
                          ? foodListProvider.expandedFood!.note.toString()
                          : '📝',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

class LabelChips extends StatelessWidget {
  const LabelChips({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
        builder: (context, foodListProvider, child) {
      return Container(
        child: foodListProvider.expandedFood!.labelList == null
            ? Text('Nessuna etichetta')
            : Wrap(
                children: [iterableChip(foodListProvider)],
              ),

        // for (var label in foodListProvider.expandedFood!.labelList!) {
        //   return Chip(
        //     label: Text(label.toString()),
        //     backgroundColor: Colors.white,
        //     elevation: 1,
        //     shadowColor: Colors.teal,
        //   );
        // },
      );
    });
  }

  dynamic iterableChip(FoodListProvider foodListProvider) {
    for (var label in foodListProvider.expandedFood!.labelList!) {
      return Chip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label.icon.toString()),
            Text(' '),
            Text(label.name.toString()),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.teal,
      );
    }
  }
}

// Widget buildChips(FoodListProvider foodListProvider, int index) => Wrap(
//   children:  foodListProvider.map(() => Chip(
//         label: Row(
//           children: [
//             Text(
//                 foodListProvider.expandedFood!.labelList![index].icon.toString()),
//             Text(' '),
//             Text(
//                 foodListProvider.expandedFood!.labelList![index].name.toString()),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         shadowColor: Colors.teal,
//       )).toList(),
// );
